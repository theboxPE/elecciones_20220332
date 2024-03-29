import 'dart:io';
import 'package:flutter/material.dart';
import 'datos.dart';

class VivenciaDetailsScreen extends StatelessWidget {
  final Vivencia vivencia;

  const VivenciaDetailsScreen({super.key, required this.vivencia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vivencia.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              vivencia.descripcion,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Fecha: ${vivencia.date.toString()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            if (vivencia.imagePath != null)
              Image.file(
                File(vivencia.imagePath!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            if (vivencia.audioPath != null)
              Column(
                children: [
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Reproducir el audio
                    },
                    child: const Text('Reproducir Audio'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
