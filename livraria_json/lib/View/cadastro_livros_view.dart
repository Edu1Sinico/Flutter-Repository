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
  final TextEditingController _CapaController = TextEditingController();
  final TextEditingController _SinopseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Título não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _autorController,
                  decoration: InputDecoration(
                    labelText: 'Autor',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Autor não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _editoraController,
                  decoration: InputDecoration(
                    labelText: 'Editora',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Editora não pode ser vazia!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _SinopseController,
                  decoration: InputDecoration(
                    labelText: 'Sinopse',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Sinopse não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _categoriaController,
                  decoration: InputDecoration(
                    labelText: 'Categoria, separe por vírgula',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Categoria não pode ser vazia!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _anoPublicacaoController,
                  decoration: InputDecoration(
                    labelText: 'Ano de Publicação',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Ano de publicação não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _isbnController,
                  decoration: InputDecoration(
                    labelText: 'ISBN',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'ISBN não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Valor não pode ser vazio!';
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(
                  height: 28,
                ),
                ElevatedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                       _cadastrarLivro();
                       }},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
