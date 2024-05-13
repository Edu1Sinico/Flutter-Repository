// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exemplo_api_tempo/service.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Controller _cidadeController = Controller();
  // Instância do serviço WeatherService para obter os dados de previsão do tempo.
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  // Mapa que armazenará os dados de previsão do tempo.
  late Map<String, dynamic> _weatherData;
  final TextEditingController _cidadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weatherData = new Map<String, dynamic>();
    // _fetchWeatherData('São Paulo');
  }

  // Método assíncrono para buscar os dados de previsão do tempo para uma cidade específica.
  Future<void> _fetchWeatherData(String city) async {
    try {
      // Obtém os dados de previsão do tempo para a cidade especificada.
      final weatherData = await _weatherService.getWeather(city);
      // Atualiza o estado do widget com os novos dados de previsão do tempo.
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      // Em caso de erro ao buscar os dados de previsão do tempo, exibe uma mensagem de erro no console.
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
        backgroundColor: Colors.amber,
      ),

      // -------------------- Correção do Professor --------------------
      // body: FutureBuilder(
      //   future: _fetchWeatherData('São Paulo'),
      //   builder: ((context, snapshot) {
      //     if (_weatherData.isEmpty) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             TextFormField(
      //               controller: _cidadeController,
      //               decoration: InputDecoration(
                    
      //               )
      //               // validator: (value) {

      //               // },
      //             ),
      //             Text(
      //                 'City: ${_weatherData['name']}'), // Exibe o nome da cidade.
      //             Text(
      //                 'Temperature: ${(_weatherData['main']['temp'] - 273).toStringAsFixed(2)} °C'), // Exibe a temperatura em graus Celsius.
      //             Text(
      //                 'Description: ${_weatherData['weather'][0]['description']}'), // Exibe a descrição do clima.
      //           ],
      //         ),
      //       );
      //     }
      //   }),
      // ),

      // -------------------- O que eu fiz --------------------
       body: _weatherData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _cidadeController,
                    decoration: InputDecoration(
                      hintText: 'Digite a cidade',
                      border: OutlineInputBorder(),
                      ),
                  ),
                  SizedBox(height: 15,),
                  TextButton(onPressed:
                  () {
                    if(_cidadeController != null){
                    _fetchWeatherData(_cidadeController.text);
                    }
                    else{
                      _fetchWeatherData('São Paulo');
                    }
                  },
                  child: Text("Clicar")),
                  SizedBox(height: 15,),
                  Text(
                      'City: ${_weatherData['name']}'), // Exibe o nome da cidade.
                  Text(
                      'Temperature: ${(_weatherData['main']['temp'] - 273).toStringAsFixed(2)} °C'), // Exibe a temperatura em graus Celsius.
                  Text(
                      'Description: ${_weatherData['weather'][0]['description']}'), // Exibe a descrição do clima.
                ],
              ),
              ),
            ),
    );
  }
}
