// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exemplo_interface/ExercicioLista1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExercicioLista2());
}

class ExercicioLista2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('Menu', style: TextStyle(fontSize: (25.0), color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                title: Text('Lista de exercícios 1'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercicioLista2()));
// Ação ao tocar na opção do Drawer
                },
              ),
// Outras opções de navegação...
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("My App", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                
              },
            )
          ],
        ),

        body: Container(
          child: Row(
            children: [
              Column(
                
              ),
              Column(

              ),
            ],
            
          ),
        ),
      ),
    );
  }
}
