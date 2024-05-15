// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_monitoria/view/Home.dart';
import 'package:projeto_monitoria/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: const Color.fromARGB(255, 0, 0, 0),
        // home: HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        '/Login': (context) => const LoginPage(),
      }
    );
  }
}
