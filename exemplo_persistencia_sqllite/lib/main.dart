// ignore_for_file: prefer_const_constructors

import 'package:exemplo_persistencia_sqllite/View.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto SqlLite",
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: HomePage(),
    );

  }
}