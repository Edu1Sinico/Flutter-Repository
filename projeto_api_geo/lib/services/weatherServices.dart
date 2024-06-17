// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherServices {
  // atributos
  final String apiKey = "e83b3c4c08285bf87b99f9bbc0abe3f0";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  // métodos
  Future<Map<String, dynamic>> getWeather(String city) async {
    // Constrói a URL completa para fazer a solicitação à API de previsão do tempo.
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');

    // Faz uma solicitação GET para a URL construída e aguarda a resposta.
    final response = await http.get(url);

    // Verifica se a resposta foi bem-sucedida (código de status 200).
    if (response.statusCode == 200) {
      // Se a resposta foi bem-sucedida, decodifica o corpo da resposta de JSON para um mapa.
      return jsonDecode(response.body);
    } else {
      // Se a resposta não foi bem-sucedida, lança uma exceção indicando o erro.
      throw Exception('Failed to load weather data');
    }
  }

  // Método de buscar as informações pela localização
  Future<Map<String, dynamic>> getWeatherByLocation(
      double lat, double lon) async {
    // Constrói a URL completa para fazer a solicitação à API de previsão do tempo.
    final url = Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey');

    // Faz uma solicitação GET para a URL construída e aguarda a resposta.
    final response = await http.get(url);

    // Verifica se a resposta foi bem-sucedida (código de status 200).
    if (response.statusCode == 200) {
      // Se a resposta foi bem-sucedida, decodifica o corpo da resposta de JSON para um mapa.
      return jsonDecode(response.body);
    } else {
      // Se a resposta não foi bem-sucedida, lança uma exceção indicando o erro.
      throw Exception('Failed to load weather data');
    }
  }

  Future<bool> findCity(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
