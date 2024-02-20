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
  String _resultado = '';
  int _cont = 0;
  int _randomNumber = 0;
  Random random = new Random();

  void _verificar(String acao) {
    int numero1 = int.parse(_controllerNumero1.text);

    _randomNumber = _cont == 0 ? random.nextInt(100) : _randomNumber;

    setState(() {
      if (acao == "Verify") {
        if (numero1 == _randomNumber) {
          _resultado =
              'Você acertou o número! Você acertou com $_cont tentativas';
          _cont = 0;
          _randomNumber = random.nextInt(100);
        } else if (numero1 > _randomNumber) {
          _resultado = 'O número digitado está acima do número pensado';
          _cont++;
        } else if (numero1 < _randomNumber) {
          _resultado = 'O número digitado está abaixo do número pensado';
          _cont++;
        } else {
          _resultado = 'Por favor, digite somente números!';
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
              decoration: InputDecoration(labelText: 'Digite um número: '),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _verificar('Verify'),
              child: Text('Verificar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
