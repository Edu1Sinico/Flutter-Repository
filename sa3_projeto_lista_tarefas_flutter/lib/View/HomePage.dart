// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, no_logic_in_create_state, must_be_immutable, file_names

import 'package:flutter/material.dart'; // Importação da biblioteca Flutter Material
import 'package:projeto_sa2_user_login_register/View/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importação da biblioteca de preferências compartilhadas

void main() {
  runApp(MyApp()); // Execução do aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "";

    return MaterialApp(
      title: 'Lista de Tarefas', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema do aplicativo
      ),
      home: HomePage(name: name), // Tela inicial do aplicativo
    );
  }
}

class HomePage extends StatefulWidget {
  String name;
  HomePage({required this.name});

  @override
  _HomePageState createState() => _HomePageState(name: name);
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = []; // Lista de tarefas
  final TextEditingController _controller =
      TextEditingController(); // Controlador de texto para o campo de entrada de nova tarefa
  String name;
  late SharedPreferences _prefs;

  _HomePageState({required this.name});

  @override
  void initState() {
    super.initState();
    loadTasks(); // Carrega as tarefas ao iniciar a tela
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tasks = prefs.getStringList('${name}tasks') ??
          []; // Carrega as tarefas armazenadas ou uma lista vazia se não houver tarefas
    });
  }

  Future<void> saveTasks() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await _prefs.setStringList('${name}tasks',
        tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'), // Título da barra de aplicativos
        actions: [
          IconButton(
            onPressed: () {
              _handleLogout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Número de itens na lista de tarefas
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]), // Título do item da lista
            onLongPress: () {
              setState(() {
                tasks.removeAt(index); // Remove a tarefa da lista
                saveTasks(); // Salva as tarefas atualizadas
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'), // Título do diálogo de nova tarefa
                content: TextField(
                  controller:
                      _controller, // Controlador de texto para o campo de entrada
                  decoration: InputDecoration(
                      hintText: 'Digite a tarefa'), // Dica no campo de entrada
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(
                            _controller.text); // Adiciona a nova tarefa à lista
                        saveTasks(); // Salva as tarefas atualizadas
                        _controller.clear(); // Limpa o campo de entrada
                        Navigator.of(context).pop(); // Fecha o diálogo
                      });
                    },
                    child: Text('Adicionar'), // Botão para adicionar a tarefa
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add), // Ícone do botão de adicionar
      ),
    );
  }

  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
