import 'package:elecciones_20220332/agregar.dart';
import 'package:elecciones_20220332/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define las rutas de navegación
      initialRoute: '/',
      routes: {
        '/': (context) => const VivenciaListScreen(),
        '/add_vivencia': (context) => const AddVivenciaScreen(), // Ruta para la pantalla de la lista de eventos
        // Puedes agregar más rutas según sea necesario
      },
    );
  }
}

