import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicationList extends StatefulWidget {
  const MedicationList({Key? key}) : super(key: key);

  @override
  MedicationListState createState() => MedicationListState();
}

class MedicationListState extends State<MedicationList> {
  late List<dynamic> medications = [];

  Future<void> _fetchMedications() async {
    final response = await http.get(
      Uri.parse(
          'https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20220401]&count=patient.drug.medicinalproduct.exact'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        medications = jsonResponse['results'];
      });
    } else {
      throw Exception('Failed to fetch medications');
    }
  }

  void _showMedicationDetails(BuildContext context, dynamic medication) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(medication['term']),
          content: Text('Count: ${medication['count']}'),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
        backgroundColor: const Color.fromRGBO(0, 67, 130, 1.0),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, 'botones');
            },
          ),
        ],
      ),
      body: medications != []
          ? ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showMedicationDetails(context, medications[index]);
                  },
                  child: ListTile(
                    title: Text(medications[index]['term']),
                    subtitle: Text('Count: ${medications[index]['count']}'),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
