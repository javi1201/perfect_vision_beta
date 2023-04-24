import 'package:flutter/material.dart';
import '../../providers/menu_provider.dart';
import '../../utils/icono_string_util.dart';

class PruebasPage extends StatelessWidget {
  const PruebasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas'),
        backgroundColor: const Color.fromRGBO(82, 147, 206, 1.0),
      ),
      body: Hero(
        tag: "pruebasButton",
        child: Container(
          color: Colors.black,
          child: Center(
            child: _lista(),
          ),
        ),
      ),
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
                    title: Text(opt['texto']),
                    leading: getIcon(opt['icon']),
                    trailing: const Icon(Icons.keyboard_arrow_right,
                        color: Colors.blue),
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
        },
      );
      opciones.add(widgetTemp);
      opciones.add(const Divider());
    }
    return opciones;
  }
}
