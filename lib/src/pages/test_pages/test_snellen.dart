import 'package:flutter/material.dart';

class SnellenPage extends StatelessWidget {
  const SnellenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Test de Snellen'),
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'data/assets/images/test_bicromo/cartilla_snell.jpg'),
          ),
        ),
      ),
    );
  }
}
