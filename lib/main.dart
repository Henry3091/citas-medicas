import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome.dart';
import 'login.dart';
import 'registro.dart';
import 'citas.dart';
import 'servicios.dart';
import 'firebase_options.dart'; // <<<< IMPORTANTE

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // <<<< OJO
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/registro': (context) => Registro(),
        '/citas': (context) => Citas(),
        '/servicios': (context) => Servicios(),
      },
    );
  }
}
