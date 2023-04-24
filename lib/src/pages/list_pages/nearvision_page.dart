import 'package:flutter/material.dart';

import '../../providers/menu_provider4.dart';
import '../../utils/icono_string_util.dart';

class NearVisionPage extends StatelessWidget {
  const NearVisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test de Visión Cercana'),
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
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /*final route =
              MaterialPageRoute(builder: (context) => const AlertPage());
          Navigator.push(context, route);*/
        },
      );
      opciones.add(widgetTemp);
      opciones.add(const Divider());
    }
    return opciones;
  }
}
