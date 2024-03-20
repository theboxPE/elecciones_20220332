import 'dart:io';
import 'package:flutter/material.dart';
import 'package:elecciones_20220332/datos.dart';
import 'package:audioplayers/audioplayers.dart';


class EventDetailsScreen extends StatelessWidget {
  final Datos datos;

  const EventDetailsScreen({super.key, required this.datos});

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
              datos.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              datos.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Fecha: ${datos.date.toString()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            if (datos.imagePath != null)
              Image.file(
                File(datos.imagePath!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            if (datos.audioPath != null) // Mostrar reproductor de audio si hay un audio disponible
              AudioPlayerWidget(audioPath: datos.audioPath!),
          ],
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  const AudioPlayerWidget({super.key, required this.audioPath});

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}


class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.OnPlayerCompletion.listen((event) {
      // Lógica para manejar la finalización de la reproducción
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Audio:',
          style: TextStyle(fontSize: 18),
        ),
        ElevatedButton(
          onPressed: () {
            audioPlayer.play(widget.audioPath, isLocal: true); // Reproducir el audio
          },
          child: const Text('Reproducir Audio'),
        ),
        ElevatedButton(
          onPressed: () {
            audioPlayer.stop(); // Detener la reproducción del audio
          },
          child: const Text('Detener Audio'),
        ),
      ],
    );
  }
}
