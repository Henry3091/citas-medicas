import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/registro'),
              child: Text('Registro'),
            ),
            SizedBox(height: 20),
            Text('Desarrollado por: Henry Aguiar'),
            Text('GitHub: https://github.com/Henry3091/citas-medicas.git'),
          ],
        ),
      ),
    );
  }
}
