import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_vision/src/pages/scroll_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/login_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();
    final initialPage =
        MaterialPageRoute(builder: (context) => const ScrollPage());

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            await prefs.setBool('isLoggedIn', false);
            bloc.emailSink.add('');
            bloc.passwordSink.add('');
            bloc.dispose();
            Navigator.pushAndRemoveUntil(
              context,
              initialPage,
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Cerrar sesión'),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromRGBO(0, 67, 130, 1.0),
        primaryColor: Colors.white,
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 2, // Agrega esta línea
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
}
