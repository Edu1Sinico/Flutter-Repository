// ignore_for_file: prefer_is_not_empty
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:app_shopping_list/listaComprasModel.dart';

class ListaComprasController extends ChangeNotifier {
  BuildContext context;

  ListaComprasController(this.context);

  List<Compras> _compras = [];

  List<Compras> get compras => _compras;

  // método CRUD
  void adicionarCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _compras.add(Compras(descricao.trim(), false));
      notifyListeners();
    } else {
      _avisoVazio(context);
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = !_compras[indice].concluida;
      notifyListeners();
    }
  }

  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }

  void atualizarCompra(int indice, String descricao){
    if (indice >= 0 && indice < _compras.length) {
      _compras.add(Compras(descricao.trim(), _compras[indice].concluida));
      notifyListeners();
    }
  }

  void _avisoVazio(BuildContext context) { // Criar um método para abrir uma caixa de diálogop
// set up the button
    Widget okButton = TextButton( // Cria o botão de OK
    
      child:Text("OK"), 
      onPressed: () {
        Navigator.of(context)
            .pop(); // Fechar o AlertDialog ao pressionar o botão "OK"
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("⚠ Aviso ⚠"),
      content: Text("Por favor, digite uma informação para a lista."),
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
