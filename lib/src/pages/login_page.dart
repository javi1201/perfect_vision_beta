import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_vision/src/bloc/login_bloc.dart';
import 'package:perfect_vision/src/providers/usuario_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usuarioProvider = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _crearFondo(context),
            _loginForm(context),
          ],
        ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.maybeOf(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                //const Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                //const SizedBox(height: 60.0),
                _crearEmail(bloc),
                const SizedBox(height: 30.0),
                _crearPassword(bloc),
                const SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          const Text('¿Olvitaste tu contraseña?'),
          const SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.alternate_email,
                color: Color.fromRGBO(0, 70, 134, 1),
              ),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              //counterText: snapshot.data,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Color.fromRGBO(0, 70, 134, 1),
                  ),
                  labelText: 'Contraseña',
                  //counterText: snapshot.data,
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  Widget _crearBoton(LoginBloc bloc) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 5.0,
      backgroundColor: const Color.fromRGBO(0, 70, 134, 1),
    );

    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            style: style,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: const Text('Ingresar'),
            ),
          );
        });
  }

  _login(LoginBloc bloc, BuildContext context) async {
    final authService = FirebaseAuthService();
    final email = bloc.email;
    final password = bloc.password;
    try {
      final user =
          await authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        // Limpiar las credenciales previas almacenadas en preferencias compartidas
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', '');
        await prefs.setString('password', '');

        // Login exitoso, navegar a la siguiente pantalla
        Navigator.pushReplacementNamed(context, 'botones');
      } else {
        // Login fallido, mostrar un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuario o contraseña incorrectos.'),
        ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No hay ningún usuario registrado con ese email.'),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Contraseña incorrecta.'),
        ));
      } else if (e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Se ha bloqueado el acceso a esta cuenta debido a actividad inusual. Intente de nuevo más tarde.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message ?? 'Ocurrió un error1.'),
        ));
      }
    } catch (e) {
      // Ocurrió un error, mostrar un mensaje de error genérico
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ocurrió un error2.'),
      ));
    }

    // Limpiar los campos de correo electrónico y contraseña
    bloc.emailSink.add('');
    bloc.passwordSink.add('');
  }

  Widget _crearImagen() {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      width: double.infinity,
      height: double.infinity,
      child: const Image(
        image: AssetImage(
            'data/assets/images/background_images/background_tech06.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 255, 255, 0),
        Color.fromRGBO(255, 255, 255, 0)
      ])),
    );
    /*final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: const Color.fromRGBO(7, 78, 142, 0.3)),
    );*/

    return Stack(
      children: [
        fondoMorado,
        _crearImagen(),
        //Positioned(top: 85.0, left: 30.0, child: circulo),
        //Positioned(top: 20.0, right: -30.0, child: circulo),
        //Positioned(bottom: -50.0, left: -10.0, child: circulo),
        //Positioned(bottom: 120.0, right: 20.0, child: circulo),
        //Positioned(bottom: -50.0, right: -20.0, child: circulo),
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          child: const Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Color.fromRGBO(0, 70, 134, 1),
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Iniciar Sesión',
                style: TextStyle(
                    color: Color.fromRGBO(0, 70, 134, 1),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
