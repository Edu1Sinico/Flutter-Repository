import 'package:app_todo_list/tarefaController.dart';
import 'package:app_todo_list/tarefaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListarTarefasApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen 
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasControler(context),
        child: ListaTarefasScreen(),
      )
    );
  }
}