import 'package:flutter/material.dart';
import 'package:perfect_vision/src/pages/login_page.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [_pagina1(), _pagina2()],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: [
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: const Image(
        image: AssetImage(
            'data/assets/images/background_images/perfect_vision.png'),
        //fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    const estiloTexto = TextStyle(color: Colors.blue, fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text('', style: estiloTexto),
          const Text('', style: estiloTexto),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 70.0,
            color: Color.fromRGBO(0, 67, 130, 1),
          )
        ],
      ),
    );
  }

  Widget _pagina2() {
    return LoginPage();
    /*return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white
              /*textColor: Colors.white,*/
              ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text('Iniciar Sesión', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () {},
        ),
      ),
    );*/
  }
}
