import 'dart:io';

import 'package:flutter/material.dart';

import '../Controller/livrosController.dart';

class ListarLivrosScreen extends StatefulWidget {
  const ListarLivrosScreen({super.key});

  @override
  State<ListarLivrosScreen> createState() => _ListarLivrosScreenState();
}

class _ListarLivrosScreenState extends State<ListarLivrosScreen> {
  final LivrosController _controller = LivrosController();

  @override
  void initState() {
    super.initState();
    _controller.listLivros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listar Livros'),
        ),
        body: Expanded(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: //lista livros
                    ListView.builder(
                  itemCount: _controller.listLivros.length,
                  itemBuilder: (context, index) {
                    ListTile(
                      leading:
                          Image.file(File(_controller.listLivros[index].capa)),
                      title: Text(_controller.listLivros[index].titulo),
                      subtitle: Text(_controller.listLivros[index].autor),
                    );
                    return null;
                  },
              )
            )
          )
        );
  }
}