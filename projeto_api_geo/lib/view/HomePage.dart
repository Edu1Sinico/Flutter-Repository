// ignore_for_file: prefer_const_constructors, file_names, avoid_print, unused_element, unnecessary_new, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/controller/weatherController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherController _controller = new WeatherController();

  @override
  void initState() {
    _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    try {
      Position _position = await Geolocator.getCurrentPosition();
      print(_position.latitude + _position.longitude);
      _controller.getWeatherByLocation(_position.latitude, _position.longitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Previsão do Tempo'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/Favorites');
                      },
                      child: Text("Favorites")),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Search');
                      },
                      child: Text("Localization")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //construir a exibição do clima(geolocalização)
              Builder(builder: (context) {
                if (_controller.weatherList.isEmpty) {
                  return Column(children: [
                    const Text("Location not found"),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather();
                      },
                    )
                  ]);
                } else {
                  return Column(
                    children: [
                      Text(_controller.weatherList.last.name),
                      Text(_controller.weatherList.last.main),
                      Text(_controller.weatherList.last.description),
                      Text((_controller.weatherList.last.temp - 273)
                          .toStringAsFixed(2)),
                      Text((_controller.weatherList.last.temp_max - 273)
                          .toStringAsFixed(2)),
                      Text((_controller.weatherList.last.temp_min - 273)
                          .toStringAsFixed(2)),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
