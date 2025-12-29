import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Citas extends StatelessWidget {
  final id = TextEditingController();
  final especialidad = TextEditingController();
  final dia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Citas')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menú')),
            ListTile(
              title: Text('Servicios'),
              onTap: () => Navigator.pushNamed(context, '/servicios'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: id, decoration: InputDecoration(labelText: 'ID Cita')),
            TextField(controller: especialidad, decoration: InputDecoration(labelText: 'Especialidad')),
            TextField(controller: dia, decoration: InputDecoration(labelText: 'Día')),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('citas').add({
                  'id': id.text,
                  'especialidad': especialidad.text,
                  'dia': dia.text,
                });
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
