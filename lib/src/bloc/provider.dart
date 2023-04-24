import 'package:flutter/material.dart';
import 'package:perfect_vision/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider? _instancia;

  factory Provider({Key? key, required Widget child}) {
    _instancia ??= Provider._internal(key: key, child: child);
    return _instancia!;
  }

  Provider._internal({super.key, required Widget child}) : super(child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc maybeOf(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
  }
}
