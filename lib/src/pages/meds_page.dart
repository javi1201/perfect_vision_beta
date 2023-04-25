import 'package:flutter/material.dart';

class MedicationList extends StatelessWidget {
  MedicationList({Key? key}) : super(key: key);

  final List<Map<String, String>> eyeMedications = [
    {
      "name": "Latanoprost",
      "description":
          "Medicamento que se utiliza para tratar el glaucoma y la hipertensión ocular.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/37353/thumbnail/1763205.jpg?1641477300",
    },
    {
      "name": "Timolol",
      "description":
          "Es un medicamento que se utiliza para reducir la presión intraocular en personas con glaucoma.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/37345/thumbnail/1763297.jpg?1641477301",
    },
    {
      "name": "Brinzolamide",
      "description":
          "Es un medicamento que se utiliza para reducir la presión intraocular en personas con glaucoma y la hipertensión ocular.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/42327/thumbnail/22007_001.jpg?1641477029",
    },
    {
      "name": "Dorzolamide",
      "description":
          "La dorzolamida es un medicamento que se utiliza en oftalmología para el tratamiento del glaucoma de ángulo abierto y la hipertensión ocular.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/28356/thumbnail/2973980.jpg?1641479658",
    },
    {
      "name": "Tobramicina",
      "description":
          "Es un antibiótico que se usa para tratar infecciones oculares bacterianas.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/69231/thumbnail/2974006.jpg?1646236904",
    },
    {
      "name": "Ketorolaco",
      "description":
          "Es un antiinflamatorio no esteroideo (AINE) que se utiliza para reducir el dolor y la inflamación en los ojos después de una cirugía.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/28725/thumbnail/439841.jpg?1641477865",
    },
    {
      "name": "Brimonidina",
      "description":
          "Es un medicamento que se utiliza para reducir la presión intraocular en personas con glaucoma.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/28362/thumbnail/2974081.jpg?1641479657",
    },
    {
      "name": "Ciclosporina",
      "description":
          "Es un medicamento que se utiliza para tratar la sequedad ocular crónica.",
      "image":
          "https://d1tjllbjmslitt.cloudfront.net/spree/products/27591/thumbnail/431607.jpg?1641479726",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Medicamentos'),
          backgroundColor: const Color.fromRGBO(82, 147, 206, 1.0),
        ),
        body: Container(
          color: const Color.fromRGBO(236, 247, 247, 1),
          child: Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: eyeMedications.length,
              itemBuilder: (BuildContext context, int index) {
                final medication = eyeMedications[index];
                return Card(
                  elevation: 3.0,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(medication["image"]!),
                    ),
                    title: Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          medication["name"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(medication["description"]!)),
                    onTap: () {
                      // Navigate to medication details page
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
