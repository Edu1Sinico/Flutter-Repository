import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;

// Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo MediaQuery'),
        ),
        body: Center(
          child: Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.all(16.0),
            color: Color.fromARGB(255, 193, 206, 8),
            child: Text(
              'Texto Responsivo',
              style: TextStyle(fontSize: textSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
