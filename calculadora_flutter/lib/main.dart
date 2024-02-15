import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double resultado;

    setState(() {
      if (identical(operacao, "Somar")) {
        resultado = numero1 + numero2;
        print("Resultado da Soma: $resultado");
        _resultado = resultado.toString();
      } else if (identical(operacao, "Subtrair")) {
        resultado = numero1 - numero2;
        print("Resultado da Subtração: $resultado");
        _resultado = resultado.toString();
      } else if (identical(operacao, "Multiplicar")) {
        resultado = numero1 * numero2;
        print("Resultado da Multiplicação: $resultado");
        _resultado = resultado.toString();
      } else if (identical(operacao, "Dividir")) {
        if (numero2 != 0) {
          resultado = numero1 / numero2;
          print("Resultado da Divisão: $resultado");
          _resultado = resultado.toString();
        } else {
          _resultado = "Não é possível dividir por zero!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Somar'),
              child: Text('Somar'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Subtrair'),
              child: Text('Subtrair'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Multiplicar'),
              child: Text('Multiplicar'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Dividir'),
              child: Text('Dividir'),
            ),
            SizedBox(height: 16.0),
            Text('Resultado: $_resultado'),
          ],
        ),
      ),
    );
  }
}
