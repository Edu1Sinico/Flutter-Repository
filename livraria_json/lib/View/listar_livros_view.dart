// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:io';

import '../Controller/livrosController.dart';

import 'package:flutter/material.dart';

class ListarLivrosScreen extends StatefulWidget {
  const ListarLivrosScreen({super.key});

  @override
  State<ListarLivrosScreen> createState() => _ListarLivrosScreenState();
}

class _ListarLivrosScreenState extends State<ListarLivrosScreen> {
  final LivrosController _controller = new LivrosController();

 @override
  void initState() {
    super.initState();
    _controller.ListLivros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Livros'),
      ),
      body: Expanded(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: _controller.ListLivros.length,
            itemBuilder: (context, index) {
              ListTile(
                leading: Image.file(File(_controller.ListLivros[index].capa)),
                title: Text(_controller.ListLivros[index].titulo,),
                subtitle: Text(_controller.ListLivros[index].autor),
                    );
                    return null;
                  },),
      )),
    );
  }
}
