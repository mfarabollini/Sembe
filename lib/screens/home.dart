import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sembe"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage('assets/images/drawer.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("Sembe"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("AGRICULTURA",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Mapa Lotes'),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/mapalotes');
              },
            ),
            ListTile(
              leading: Icon(Icons.spa),
              dense: true,
              title: Text('Cultivos'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              dense: true,
              title: Text('Resultados'),
              onTap: () {},
            ),
            Divider(
              color: Colors.black87,
              indent: 8.0,
              endIndent: 8.0,
            ), //here is a divider
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("GANADERIA",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
            ),

            ListTile(
              leading: Icon(Icons.view_column),
              dense: true,
              title: Text('Pasturas'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.nfc),
              dense: true,
              title: Text('Rodeos'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.medication),
              dense: true,
              title: Text('Sanidad'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.blur_circular),
              title: Text('Rollos'),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/rollos');
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              dense: true,
              title: Text('Ventas'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 10,
                    child: Text('Vacas'),
                  ),
                  Text('Nov/Vaq'),
                  Text('Toros'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
