import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class Servicios extends StatefulWidget {
  const Servicios({super.key}); // Constructor con key

  @override
  State<Servicios> createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  List<dynamic> servicios = []; // Tipo explícito

  @override
  void initState() {
    super.initState();
    cargarServicios();
  }

  Future<void> cargarServicios() async {
    try {
      final response = await http.get(
        Uri.parse('https://jritsqmet.github.io/web-api/medico.json'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          servicios = data['servicio_medico'];
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al cargar servicios')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servicios Médicos')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menú')),
            ListTile(
              title: const Text('Citas'),
              onTap: () => Navigator.pushNamed(context, '/citas'),
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: servicios.length,
        itemBuilder: (context, index) {
          final servicio = servicios[index];
          return ListTile(
            leading: Image.network(
              servicio['info']['imagen'],
              width: 50,
            ),
            title: Text(servicio['nombre']),
            subtitle: Text(servicio['horario']),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(servicio['nombre']),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(servicio['descripcion']),
                      const SizedBox(height: 10),
                      Text('Precio: ${servicio['info']['precio']}'),
                      Text('Duración: ${servicio['info']['duracion']}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
