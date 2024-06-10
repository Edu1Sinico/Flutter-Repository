// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_api_geo/view/HomePage.dart';
import 'package:projeto_api_geo/view/searchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto API GEO",
      // home: HomeScreen(),
      routes: {
        '/': (context) => HomeScreen(),
        // '/Favorites': (context) => FavoritesScreen(),
        '/Search': (context) => SearchScreen(),
      },
    );
  }
}