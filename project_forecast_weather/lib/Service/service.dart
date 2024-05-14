import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey;
  final String baseUrl;

  WeatherService({required this.apiKey, required this.baseUrl});

  Future<Map<String, dynamic>> getWeather(String city)
  async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');
    final response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');

    }
  }

Future<Map<String, dynamic>> getWeatherbyLocation(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load wather data');

    }
  }

}