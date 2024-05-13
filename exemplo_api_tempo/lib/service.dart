// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey;
  final String baseUrl;

  WeatherService({required this.apiKey, required this.baseUrl});

// Método para obter dados de previsão do tempo para uma cidade específica.
  Future<Map<String, dynamic>> getWeather(String city) async {
    // Constrói a URL completa para fazer a solicitação à API de previsão do tempo.
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');

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
}
