import 'package:flutter/material.dart';

class ExerciciosLista2 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Exercício 8: Layout com Abas (TabBar)
      home: DefaultTabController(
        length: 8, // Define o tamanho do Layout
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciciosLista2()));
                },
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
                      color: Color.fromRGBO(223, 0, 0, 1),
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
              // Exercício 6:

              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 7:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 8:
              // ---------------------------------------------------------------------------------------------------------------------------------------
              // Exercício 10:
            ],
          ),
        ),
      ),
    );
  }
}
