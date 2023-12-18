import 'dart:async';
import 'package:perfect_vision/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del string
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(
        emailStream,
        passwordStream,
        (email, password) => email.isNotEmpty && password.isNotEmpty,
      );

  //Insertar valores al string

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //AGREGAR emailSink
  Sink<String> get emailSink => _emailController.sink;
  Sink<String> get passwordSink => _passwordController.sink;

  //OBTENER EL ULTIMO VALOR INGRESADO A LOS STREAMS
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
