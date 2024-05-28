// ignore_for_file: empty_catches, file_names, prefer_final_fields, avoid_print

import 'package:projeto_api_geo/model/weather.dart';
import 'package:projeto_api_geo/services/weatherServices.dart';

class WeatherController {
  List<Weather> _weatherList = [];

  // Get
  List<Weather> get weatherList => _weatherList;

  WeatherServices _service = WeatherServices();

  // Métodos
  Future<void> getWeather(String city) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeather(city));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getWeatherByLocation(double lat, double lon) async {
    try {
      Weather weather =
          Weather.fromJson(await _service.getWeatherByLocation(lat, lon));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  // findCity
  Future<bool> findCity(String city) async {
    try {
      return await _service.findCity(city);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
