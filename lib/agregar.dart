import 'dart:io';
import 'package:elecciones_20220332/db.dart';
import 'package:elecciones_20220332/datos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddVivenciaScreen extends StatefulWidget {
  const AddVivenciaScreen({super.key});

  @override
  AddVivenciaScreenState createState() => AddVivenciaScreenState();
}

class AddVivenciaScreenState extends State<AddVivenciaScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  File? _imageFile;
  String? _audioPath; // Agregada la variable _audioPath

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _insertVivencia() async {
  final db = await DatabaseProvider.db.database;
  final event = Vivencia(
    title: _titleController.text,
    descripcion: _descriptionController.text,
    date: _selectedDate,
    imagePath: _imageFile!.path,
    audioPath: _audioPath!
  );
  await db.insert('vivencias', event.toMap());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fecha: ${_selectedDate.toString().substring(0, 10)}'),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Seleccionar fecha'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
            ElevatedButton(
              onPressed: () {
                _selectImage(context);
              },
              child: const Text('Agregar Foto'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _insertVivencia();
                Navigator.pop(context); // Vuelve a la pantalla anterior
              },
              child: const Text('Agregar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
