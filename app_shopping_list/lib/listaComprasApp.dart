import 'package:app_shopping_list/listaComprasController.dart';
import 'package:app_shopping_list/listaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListarTarefasApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen 
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(context),
        child: ListaComprasScreen(),
      )
    );
  }
}