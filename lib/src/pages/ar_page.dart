import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArCorePage extends StatefulWidget {
  const ArCorePage({Key? key});

  @override
  State<ArCorePage> createState() => _ArCorePageState();
}

class _ArCorePageState extends State<ArCorePage> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      enableTapRecognizer: true,
      enableUpdateListener: true,
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addSphere(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final sphere = ArCoreSphere(
      radius: 0.2,
      materials: [
        ArCoreMaterial(
          color: Colors.red,
          metallic: 1.0,
        ),
      ],
    );

    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0.0, 0.0, -1.0),
    );

    controller.addArCoreNode(node);
  }
}
