// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:exemplo_interface/ExercicioLista1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExercicioLista2());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset("assets/exer2/lista2/nike.png"),
          ),
        ),
      ),
    );
  }
}

class Produtos extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Barra de Pesquisa',
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: 425,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('Produto ${index + 1}'),
                    subtitle: Text('Descrição do Produto ${index + 1}'),
                    leading: Icon(Icons.shopping_bag),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Pesquisar extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Barra de Pesquisa',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExercicioLista2 extends StatefulWidget {
  @override
  _ExercicioLista2State createState() => _ExercicioLista2State();
}

class _ExercicioLista2State extends State<ExercicioLista2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('Menu',
                    style: TextStyle(
                        fontSize: (25.0),
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold)),
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
          title: Text("Nike", style: TextStyle(color: Colors.white)),
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
              onPressed: () {},
            )
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Home(), // Your Home Screen widget
            Produtos(), // Your Produtos Screen widget
            Pesquisar(), // Your Pesquisar Screen widget
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Colors.deepOrange,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisar',
            ),
          ],
          currentIndex: _selectedIndex, // Set the current index
          onTap: (int index) =>
              setState(() => _selectedIndex = index), // Update on tap
        ),
      ),
    );
  }
}
