// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:projeto_api_geo/controller/weatherController.dart';

class DetailsScreen extends StatefulWidget {
  final String cityName;
  const DetailsScreen({super.key, required this.cityName});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  WeatherController _controller = WeatherController();

  @override
  void initState() {
    _controller.getWeather(widget.cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.cityName),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Weather Details',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
                future: _controller.getWeather(widget.cityName),
                builder: (context, snapshot) {
                  if (_controller.weatherList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_controller.weatherList.last.name),
                            //icon favorite
                            IconButton(
                              icon: const Icon(Icons.favorite_border_outlined),
                              onPressed: () {
                                // adicionar aos favoritos
                              },
                            ),
                          ],
                        ),
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
                })
          ],
        ),
      ),
    );
  }
}
