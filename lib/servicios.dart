import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Servicios extends StatefulWidget {
  @override
  _ServiciosState createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  List servicios = [];

  @override
  void initState() {
    super.initState();
    cargarServicios();
  }

  cargarServicios() async {
    final response = await http.get(
      Uri.parse('https://jritsqmet.github.io/web-api/medico.json'),
    );

    final data = json.decode(response.body);
    setState(() {
      servicios = data['servicio_medico'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Servicios Médicos')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menú')),
            ListTile(
              title: Text('Citas'),
              onTap: () => Navigator.pushNamed(context, '/citas'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: servicios.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              servicios[index]['info']['imagen'],
              width: 50,
            ),
            title: Text(servicios[index]['nombre']),
            subtitle: Text(servicios[index]['horario']),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(servicios[index]['nombre']),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(servicios[index]['descripcion']),
                      SizedBox(height: 10),
                      Text('Precio: ${servicios[index]['info']['precio']}'),
                      Text('Duración: ${servicios[index]['info']['duracion']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
