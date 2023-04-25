import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_vision/firebase_options.dart';
import 'package:perfect_vision/src/bloc/provider.dart';
import 'package:perfect_vision/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfect Vision App',
      initialRoute: 'blog',
      routes: getApplicationRoutes(),
    ));
  }
}
