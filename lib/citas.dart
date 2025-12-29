import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Citas extends StatefulWidget {
  const Citas({super.key});

  @override
  State<Citas> createState() => _CitasState();
}

class _CitasState extends State<Citas> {
  final id = TextEditingController();
  final especialidad = TextEditingController();
  final dia = TextEditingController();

  @override
  void dispose() {
    id.dispose();
    especialidad.dispose();
    dia.dispose();
    super.dispose();
  }

  void guardarCita() async {
    if (id.text.isEmpty || especialidad.text.isEmpty || dia.text.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('citas').add({
        'id': id.text,
        'especialidad': especialidad.text,
        'dia': dia.text,
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cita guardada correctamente')),
      );

      // Limpiar campos
      id.clear();
      especialidad.clear();
      dia.clear();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Citas')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menú')),
            ListTile(
              title: const Text('Servicios'),
              onTap: () => Navigator.pushNamed(context, '/servicios'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: id,
              decoration: const InputDecoration(labelText: 'ID Cita'),
            ),
            TextField(
              controller: especialidad,
              decoration: const InputDecoration(labelText: 'Especialidad'),
            ),
            TextField(
              controller: dia,
              decoration: const InputDecoration(labelText: 'Día'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: guardarCita,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
