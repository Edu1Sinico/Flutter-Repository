// ignore_for_file: prefer_final_fields

import 'package:projeto_api_geo/model/city.dart';
import 'package:projeto_api_geo/services/cityDatabaseService.dart';

class CityController {
  // Atributos
  List<City> _cities = [];
  CityDbservice _service = CityDbservice();
  // get cities
  List<City> cities() => _cities;

  // Métodos
  // List from db
  Future<List<City>> listCitites() async {
    List<Map<String, dynamic>> maps = await _service.listCity();
    for (Map<String, dynamic> map in maps) {
      _cities.add(City.fromMap(map));
    }
    // Outra maneira de realizar a inserção de dados na lista com um For abreviado
    //_cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }

  // Add city
  Future<void> addCity(City city) async {
    await _service.insertCity(city);
  }

  // Delete city
  Future<void> deleteCity(String city) async {
    await _service.deleteCity(city);
  }

  // Update city
  Future<void> updateCity(City city) async {
    await _service.updateCity(city);
  }
}
