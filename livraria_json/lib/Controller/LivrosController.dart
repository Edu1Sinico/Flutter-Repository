// ignore_for_file: file_names, prefer_final_fields, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:livraria_json/Model/livro.dart';
import 'package:path_provider/path_provider.dart';

class LivrosController {
  List<Livro> _listLivros = [];

  //Get
  List<Livro> get ListLivros {
    return _listLivros;
  }

  void addLivro(Livro livro){
    _listLivros.add(livro);
  }
  
  //Json - Salvar/Carregar
   Future<void> salvarJson() async{
     Directory appDocDir = await getApplicationDocumentsDirectory();
     String path = appDocDir.path;
     File file = File('$path/livros.json');
     String json = jsonEncode(_listLivros);
     await file.writeAsString(json);
  }

  
}
