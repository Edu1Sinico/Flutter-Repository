// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../Model/livro.dart';

class LivrosController {

  List<Livro> _listLivros = [];
  //get
  List<Livro> get listLivros {
    return _listLivros;
  }
  void addLivro(Livro livro){
    _listLivros.add(livro);
  }
  //Json - salvar/carregar
  Future<void> salvarJson() async{
     Directory appDocDir = await getApplicationDocumentsDirectory();
     String path = appDocDir.path;
     File file = File('$path/livros.json');
     String json = jsonEncode(_listLivros);
     await file.writeAsString(json);
  }
  

}