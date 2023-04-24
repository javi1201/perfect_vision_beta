import 'package:flutter/material.dart';

import 'list_pages/pruebas_page.dart';

class BotonesPage extends StatelessWidget {
  const BotonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: [_titulos(), _botonesRedondeados(context)],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.9),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(0, 67, 130, 1.0),
            Color.fromRGBO(0, 67, 130, 1.0),
          ])),
    );

    final cajaRosa = /*Transform.rotate(
      angle: -pi / 5.0,
      child:*/
        Container(
      height: 250.0,
      width: 360.0,
      decoration: const BoxDecoration(
          //borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(colors: [
        Color.fromRGBO(0, 67, 130, 1.0),
        Color.fromRGBO(0, 67, 130, 1.0),
      ])),
      //),
    );

    return Stack(
      children: [gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Seleccione el modulo al que desea navegar a continuación.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromARGB(255, 0, 51, 99),
        primaryColor: Colors.white,
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 0, // Agrega esta línea
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Ajustes',
          )
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navegar a la pantalla de inicio
              Navigator.pushNamed(context, 'botones');
              break;
            case 1:
              // Navegar a la pantalla de blog
              Navigator.pushNamed(context, 'blog');
              break;
            case 2:
              // Cerrar sesión
              Navigator.pushNamed(context, 'settings');
              // Implementar lógica para cerrar sesión
              break;
          }
        },
      ),
    );
  }

  Widget _botonesRedondeados(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const PruebasPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: _crearBotonRedondeado(
              Colors.white,
              const Image(
                image: AssetImage(
                  'data/assets/images/icons/icons8-snellen-chart-64(1).png',
                ),
              ),
              'Pruebas',
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'medicamentos'),
            child: _crearBotonRedondeado(
                Colors.white,
                const Image(
                    image: AssetImage(
                        'data/assets/images/icons/icons8-pills-64.png')),
                'Medicamentos'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'geleria3d'),
            child: _crearBotonRedondeado(
                Colors.white,
                const Image(
                    image: AssetImage(
                        'data/assets/images/icons/icons8-360-image-64(1).png')),
                'Biblioteca 3D'),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'portafolio'),
            child: _crearBotonRedondeado(
                Colors.white,
                const Image(
                    image: AssetImage(
                        'data/assets/images/icons/icons8-comics-magazine-64.png')),
                'Portafolio PV'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'realidad'),
            child: _crearBotonRedondeado(
                Colors.white,
                const Image(
                    image: AssetImage(
                        'data/assets/images/icons/icons8-augmented-reality-64.png')),
                'Realidad Aumentada'),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'chat'),
            child: _crearBotonRedondeado(
                Colors.white,
                const Image(
                    image: AssetImage(
                        'data/assets/images/icons/icons8-chatbot-64.png')),
                'ChatBot'),
          ),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, Widget icono, String texto) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 51, 99),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 0, 51, 99),
            radius: 35.0,
            child: icono,
          ),
          Text(
            texto,
            style: TextStyle(color: color),
          ),
          const SizedBox(
            height: 5.0,
          )
        ],
      ),
    );
  }
}
