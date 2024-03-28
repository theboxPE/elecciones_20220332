import 'package:elecciones_20220332/navbar.dart';
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
      title: 'Elecciones',
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Main page'),
              SizedBox(height: 20), 
              
            ],
          ),
        ),
      )
    );
  }
}



