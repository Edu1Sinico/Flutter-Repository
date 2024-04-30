// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CadastrarLivroScreen extends StatefulWidget {
  const CadastrarLivroScreen({super.key});

  @override
  State<CadastrarLivroScreen> createState() => _CadastrarLivroScreenState();
}

class _CadastrarLivroScreenState extends State<CadastrarLivroScreen> {
  //Controllers de validção
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _editoraController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _anoPublicacaoController =
      TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  // Métodos de validações



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Livro'),
      ),
      body: Center(
        child: Form(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: InputDecoration(
                    labelText: 'Título do Livro',
                  ),
                ),
                TextFormField(
                  controller: _autorController,
                  decoration: InputDecoration(
                    labelText: 'Autor',
                  ),
                ),
                TextFormField(
                  controller: _editoraController,
                  decoration: InputDecoration(
                    labelText: 'Editora',
                  ),
                ),
                TextFormField(
                  controller: _categoriaController,
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                ),
                TextFormField(
                  controller: _anoPublicacaoController,
                  decoration: InputDecoration(
                    labelText: 'Ano de Publicação',
                  ),
                ),
                TextFormField(
                  controller: _isbnController,
                  decoration: InputDecoration(
                    labelText: 'ISBN',
                  ),
                ),
                TextFormField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                  ),
                ),
                TextFormField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                    labelText: 'Quantidade',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
