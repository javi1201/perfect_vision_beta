import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';

class CalaveraHumanaPage extends StatelessWidget {
  const CalaveraHumanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria 3D'),
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
      body: BabylonJSViewer(
          src: 'data/assets/images/3d_images/calavera_humana.glb'),
    );
  }
}
