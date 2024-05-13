import 'package:flutter/material.dart';
import 'package:livraria_json/View/Home_Screen_View.dart';
import 'package:livraria_json/View/cadastro_livros_view.dart';
import 'package:livraria_json/View/listar_livros_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livraria Senai',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cadastro': (context) => const CadastrarLivroScreen(),
        '/listar':(context) => const ListarLivrosScreen(),
      },
    );
  }
}
