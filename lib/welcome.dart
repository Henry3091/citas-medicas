import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key}); // Constructor con key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/registro'),
              child: const Text('Registro'),
            ),
            const SizedBox(height: 20),
            const Text('Desarrollado por: Henry Aguiar'),
            const Text('GitHub: https://github.com/Henry3091/citas-medicas.git'),
          ],
        ),
      ),
    );
  }
}
