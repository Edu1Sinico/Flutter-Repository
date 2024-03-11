// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(ExerciciosLista());
}

class ExerciciosLista extends StatelessWidget {
  const ExerciciosLista({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Exercício 8: Layout com Abas (TabBar)
      home: DefaultTabController(
        length: 9, // Define o tamanho do Layout
        child: Scaffold(
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
                Tab(
                  text: "7",
                ),
                Tab(
                  text: "8",
                ),
                Tab(
                  text: "9",
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(29, 198, 250, 1),
            title: Text('Lista de Exercícios'),
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
                      color: Color.fromRGBO(47, 0, 255, 1),
                      child: Text("Counteúdo 1",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 50,
                      color: Color.fromRGBO(255, 0, 0, 1),
                      child: Text("Counteúdo 2",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 50,
                      color: Color.fromRGBO(0, 104, 9, 1),
                      child: Text("Counteúdo 3",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                  ],
                ),
              ),
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 2:
              Container(
                
              ),

              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 3:
              Icon(Icons.directions_car, size: 350),
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 4:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 5:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 6:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 7:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 8:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 9:
            ],
          ),
        ),
      ),
    );
  }
}
