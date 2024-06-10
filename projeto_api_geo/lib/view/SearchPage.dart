// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:projeto_api_geo/controller/cityController.dart';
import 'package:projeto_api_geo/controller/weatherController.dart';
import 'package:projeto_api_geo/model/city.dart';
import 'package:projeto_api_geo/view/DetailsWeatherPage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final WeatherController _controller = WeatherController();
  final CityController _dbcontroller = CityController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pesquisar cidade",
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      controller: _cityController,
                      decoration:
                          InputDecoration(hintText: "Enter the city name"),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter a city";
                        }
                        return null;
                      }),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _findCity(_cityController.text);
                        }
                      },
                      child: const Text("Search")),
                  const SizedBox(height: 12),
                  FutureBuilder(
                      future: _dbcontroller.listCitites(),
                      builder: (context, snapshot) {
                        if (_dbcontroller.cities().isNotEmpty) {
                          return ListView.builder(
                              itemCount: _dbcontroller.cities().length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title:
                                      Text(_dbcontroller.cities()[index].name),
                                  onTap: () {},
                                );
                              });
                        } else {
                          return const Center(child: Text("Empty Location"));
                        }
                      }),
                ],
              )),
        ),
      ),
    );
  }

  Future<void> _findCity(String city) async {
    if (await _controller.findCity(city)) {
      //snackbar
      City cityAdd = City(name: city, favorite: false);
      _dbcontroller.addCity(cityAdd);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City found"),
          duration: Duration(seconds: 1),
        ),
      );
      //navigation to details
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(cityName: city)));
      setState(() {});
    } else {
      // snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City not found"),
          duration: Duration(seconds: 2),
        ),
      );
      _cityController.clear();
    }
  }
}
