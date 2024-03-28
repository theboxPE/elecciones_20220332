import 'dart:io';
import 'package:elecciones_20220332/db.dart';
import 'package:flutter/material.dart';
import 'agregar.dart';
import 'details.dart';
import 'datos.dart';

class VivenciaListScreen extends StatefulWidget {
  const VivenciaListScreen({super.key});

  @override
  VivenciaListScreenState createState() => VivenciaListScreenState();
}

class VivenciaListScreenState extends State<VivenciaListScreen> {
  List<Vivencia> vivencias = []; // Lista de datos

  @override
  void initState() {
    super.initState();
    _loadDatos(); // Llama a la función _loadDatos() al inicializar la pantalla
  }

  Future<void> _loadDatos() async {
    final db = await DatabaseProvider.db.database;
    final List<Map<String, dynamic>> maps = await db.query('vivencias');
    setState(() {
      vivencias = List.generate(maps.length, (i) {
        return Vivencia(
          id: maps[i]['id'],
          title: maps[i]['title'],
          descripcion: maps[i]['description'],
          date: DateTime.parse(maps[i]['date']),
          imagePath: maps[i]['imagePath'],
          audioPath: maps[i]['audioPath'], // Agregar audioPath
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vivencias'),
      ),
      body: ListView.builder(
        itemCount: vivencias.length,
        itemBuilder: (context, index) {
          final vivencia = vivencias[index];
          return ListTile(
            onTap: () {
              // Navega a la pantalla de detalles del evento cuando se hace clic en un elemento de la lista
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VivenciaDetailsScreen(vivencia: vivencia),
                ),
              );
            },
            leading: vivencia.imagePath != null
                ? CircleAvatar(
                    backgroundImage: FileImage(File(vivencia.imagePath!)),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.event),
                  ),
            title: Text(vivencia.title),
            subtitle: Text(
              '${vivencia.descripcion}\n${vivencia.date.toString()}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddVivenciaScreen()),
          ).then((newDato) {
            if (newDato != null) {
              setState(() {
                vivencias.add(newDato);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
