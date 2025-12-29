import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome.dart';
import 'login.dart';
import 'registro.dart';
import 'citas.dart';
import 'servicios.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); // Usar const con constructor que tiene key
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor con key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/registro': (context) => const Registro(),
        '/citas': (context) => const Citas(),
        '/servicios': (context) => const Servicios(),
      },
    );
  }
}
