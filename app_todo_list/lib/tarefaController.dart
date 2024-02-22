import 'package:flutter/material.dart';
import 'package:app_todo_list/tarefaModel.dart';

class ListaTarefasControler extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // método CRUD
  void adicionarTarefa(String descricao) {
    if (!descricao.isEmpty) {
      _tarefas.add(Tarefa(descricao, false));
      notifyListeners();
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
}
