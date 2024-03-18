// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ExercicioLista2.dart';

void main() {
  runApp(ExercicioLista());
}

class ExercicioLista extends StatefulWidget {
  @override
  _ExercicioListaState createState() => _ExercicioListaState();
}

class _ExercicioListaState extends State<ExercicioLista> {
  double _width = 200;
  double _height = 200;
  Color? _color = Colors.lightBlue[200];
  bool _verify = false;

  void _updateState() {
    setState(() {
      if (_verify == false) {
        _width = 400;
        _height = 400;
        _verify = true;
        _color = Color.fromARGB(255, 223, 99, 11);
      } else {
        _width = 200;
        _height = 200;
        _verify = false;
        _color = Colors.lightBlue[200];
      }
    });
  }

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Exercício 8: Layout com Abas (TabBar)
      home: DefaultTabController(
        length: 6, // Define o tamanho do Layout
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Lista de Exercícios 2'),
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
            bottom: TabBar(
              // Adiciona os elementos no TabBar
              tabs: [
                Tab(
                  text: "1",
                ),
                Tab(
                  text: "2",
                ),
                Tab(
                  text: "3",
                ),
                Tab(
                  text: "4",
                ),
                Tab(
                  text: "5",
                ),
                Tab(
                  text: "6",
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(29, 198, 250, 1),
            title: Text('Lista de Exercícios'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: TabBarView(
            //Adiciona os elementos nas devidas colunas do TabBar.
            children: [
              // Exercício 1: Layout simples.
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 50,
                      color: Color.fromRGBO(47, 9, 219, 0.868),
                      child: Text("Conteúdo 1",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 50,
                      color: Color.fromRGBO(223, 0, 0, 1),
                      child: Text("Conteúdo 2",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 50,
                      color: Color.fromRGBO(0, 104, 9, 1),
                      child: Text("Conteúdo 3",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                  ],
                ),
              ),
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 2:
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Coluna 1 - Dorime"),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        width: 150,
                        height: 150,
                        color: Color.fromRGBO(210, 237, 29, 1),
                        child: Image.asset("assets/exer2/dorime.png",
                            width: 125, height: 125),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Coluna 2 - Pa Po Pe"),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        width: 150,
                        height: 150,
                        color: Color.fromRGBO(32, 249, 39, 1),
                        child: Image.asset("assets/exer2/scatman.jpg",
                            width: 125, height: 125),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Coluna 3 - Memes"),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        width: 150,
                        height: 150,
                        color: Color.fromRGBO(147, 34, 203, 1),
                        child: Image.asset("assets/exer2/memes.jpg",
                            width: 125, height: 125),
                      ),
                    ],
                  ),
                ],
              )),

              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 3:
              ListView(
                children: [
                  ListTile(title: Text("Produto 1")),
                  ListTile(title: Text("Produto 2")),
                  ListTile(title: Text("Produto 3")),
                  ListTile(title: Text("Produto 4")),
                  ListTile(title: Text("Produto 5")),
                  ListTile(title: Text("Produto 6")),
                  ListTile(title: Text("Produto 7")),
                  ListTile(title: Text("Produto 8")),
                  ListTile(title: Text("Produto 9")),
                  ListTile(title: Text("Produto 10")),
                ],
              ),
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 5:
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Digite o Seu Nome',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller1,
                          decoration: InputDecoration(
                            labelText: 'Digite o Seu Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller2,
                          decoration: InputDecoration(
                            labelText: 'Envie uma Mensagem',
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              if (_controller.text.isNotEmpty &&
                                  _controller1.text.isNotEmpty &&
                                  _controller2.text.isNotEmpty) {
                                _controller.clear();
                                _controller1.clear();
                                _controller2.clear();
                              } else {}
                            },
                            child: Text('Enviar'),
                          )),
                    ]),
              ),

              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 7:
              Container(
                alignment: Alignment.center,
                child: Card(
                  elevation: 20,
                  color: Colors.orangeAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(25.0),
                            color: Colors.white,
                            child: Image.asset(
                              "assets/exer2/box.png",
                            ),
                            width: 150,
                            height: 150),
                        const SizedBox(height: 8),
                        const Text('Produto 1'),
                        TextButton(
                          child: const Text('Comprar'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 10:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      width: _width,
                      height: _height,
                      color: _color,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _updateState();
                          },
                          child: Text('Animar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
