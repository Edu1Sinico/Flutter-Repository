// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários', textAlign: TextAlign.center),
        backgroundColor: Colors.blue,
      ),
      // body: ,
    );
  }
}