import 'package:elecciones_20220332/acercade.dart';
import 'package:elecciones_20220332/list.dart';
import 'package:flutter/material.dart' show AssetImage, BuildContext, CircleAvatar, Colors, Column, Drawer, EdgeInsets, FontWeight, Icon, Icons, ListTile, MaterialPageRoute, Navigator, Padding, SizedBox, StatelessWidget, Text, TextStyle, Widget;


class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/fp.jpg')
            ),
            const Text(
              'Gabriel Perez Regalado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'perezregaladogabriel7@gmai.com',
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
            const SizedBox(height: 30.0),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Vivencias'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VivenciaListScreen(),
                ));
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.business_center),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contacto(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}