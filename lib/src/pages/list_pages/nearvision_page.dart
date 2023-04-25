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
        backgroundColor: const Color.fromRGBO(82, 147, 206, 1.0),
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
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot snapshot) {
        return Container(
          color: const Color.fromRGBO(236, 247, 247, 1),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final opt = snapshot.data[index];
                return Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Container(
                      child: Text(
                        opt['texto'],
                      ),
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      width: 40.0,
                      child: getIcon(opt['icon']),
                    ),
                    trailing: Container(
                      alignment: Alignment.center,
                      width: 20.0,
                      child: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, opt['ruta']);
                    },
                  ),
                );
              },
            ),
          ),
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
