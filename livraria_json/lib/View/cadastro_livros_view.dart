// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livraria_json/Controller/LivrosController.dart';

import '../Model/livro.dart';

class CadastrarLivroScreen extends StatefulWidget {
  const CadastrarLivroScreen({super.key});

  @override
  State<CadastrarLivroScreen> createState() => _CadastrarLivroScreenState();
}

class _CadastrarLivroScreenState extends State<CadastrarLivroScreen> {
  //Criar os Controllers Texto // Validações
  final _formkey = GlobalKey<FormState>();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _autorController = TextEditingController();
  TextEditingController _editoraController = TextEditingController();
  TextEditingController _sinopseController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  TextEditingController _isbnController = TextEditingController();
  TextEditingController _categoriaController = TextEditingController();

  File? _imagemSelecionada;

  LivrosController _controller = new LivrosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Livro"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: _tituloController,
                          decoration: const InputDecoration(
                            labelText: "Título do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Título não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _autorController,
                          decoration: const InputDecoration(
                            labelText: "Autor do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Autor não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _editoraController,
                          decoration: const InputDecoration(
                            labelText: "Editora do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Editora não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _sinopseController,
                          decoration: const InputDecoration(
                            labelText: "Sinopse do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Sinopse não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _categoriaController,
                          decoration: const InputDecoration(
                            labelText: "Categorias, separa por vírgula",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Categoria não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _isbnController,
                          decoration: const InputDecoration(
                            labelText: "isbn do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "isbn não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: _precoController,
                          decoration: const InputDecoration(
                            labelText: "Preço do Livro",
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Preço não pode ser Vazio";
                            } else {
                              return null;
                            }
                          }),
                      _imagemSelecionada != null
                          ? Image.file(
                              _imagemSelecionada!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox.shrink(),
                      ElevatedButton(
                        onPressed: _tirarFoto,
                        child: Text('Tirar Foto Capa Livro'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          child: const Text("Cadastrar"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _cadastrarLivro();
                            }
                          })
                    ],
                  ),
                )),
          ),
        ));
  }

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  _cadastrarLivro() {
    final livro = Livro(
      id: _controller.listLivros.length + 1,
      titulo: _tituloController.text,
      autor: _autorController.text,
      editora: _editoraController.text,
      sinopse: _sinopseController.text,
      preco: double.parse(_precoController.text),
      capa: _imagemSelecionada!.path,
      isbn: _isbnController.text,
      categoria: _categoriaController.text.split(','),
    );
    _controller.addLivro(livro);
    _controller.salvarJson();
    _cleanController();
    //snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Livro Cadastrado com Sucesso"),
      ),
    );
  }

  void _cleanController() {
    _tituloController.clear();
    _autorController.clear();
    _editoraController.clear();
    _sinopseController.clear();
    _precoController.clear();
    _isbnController.clear();
    _categoriaController.clear();
    _imagemSelecionada = null;
    setState(() {});
  }
}