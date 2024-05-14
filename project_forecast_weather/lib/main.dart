import 'package:flutter/material.dart';
import 'package:project_forecast_weather/View/favorites_screen.dart';
import 'package:project_forecast_weather/View/home_screen.dart';
import 'package:project_forecast_weather/View/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => const HomeScreen(),
        '/favorites':(context) => const FavoritesScreen(),
        '/search':(context) => const SearchScreen()
      },

    );
  }
}
