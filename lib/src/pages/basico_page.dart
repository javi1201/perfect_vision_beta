import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  const BasicoPage({super.key});

  final estiloTitulo =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = const TextStyle(fontSize: 18, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return const SizedBox(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1613967193490-1d17b930c1a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVhdXRpZnVsJTIwbGFuZHNjYXBlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
        height: 220.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago Hermoso', style: estiloTitulo),
                  const SizedBox(height: 7.0),
                  Text(
                    'Ipsum qui qui excepteur aliqua.',
                    style: estiloSubTitulo,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            const Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        const SizedBox(height: 5.0),
        Text(texto, style: const TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: const Text(
          'Voluptate nisi ad dolore incididunt. Velit tempor deserunt sint laborum ipsum nulla ut est tempor cupidatat commodo sint ipsum dolore. Ut ut dolore aliqua nostrud magna dolor voluptate enim in officia nulla voluptate mollit. Commodo commodo irure eu consequat magna amet velit. Laboris esse nulla adipisicing exercitation pariatur do magna velit eiusmod excepteur commodo. Elit qui ullamco in anim cillum duis fugiat ex dolor culpa dolor id exercitation. Nostrud duis veniam excepteur exercitation sit nulla.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
