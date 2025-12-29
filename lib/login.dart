import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: pass, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: pass.text,
                  );
                  Navigator.pushReplacementNamed(context, '/servicios');
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Credenciales incorrectas'),
                    ),
                  );
                }
              },
              child: Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
