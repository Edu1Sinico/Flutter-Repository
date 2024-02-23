// ignore_for_file: prefer_is_not_empty
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:app_todo_list/tarefaModel.dart';

class ListaTarefasControler extends ChangeNotifier {
  BuildContext context;

  ListaTarefasControler(this.context);

  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // método CRUD
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefa(descricao.trim(), false));
      notifyListeners();
    } else {
      _aviso(context);
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = !_tarefas[indice].concluida;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }

  void _aviso(BuildContext context) { // Criar um método para abrir uma caixa de diálogop
// set up the button
    Widget okButton = TextButton( // Cria o botão de OK
      child: Text("OK"), 
      onPressed: () {
        Navigator.of(context)
            .pop(); // Fechar o AlertDialog ao pressionar o botão "OK"
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Aviso"),
      content: Text("Por favor, digite uma tarefa."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
