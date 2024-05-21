class Weather {
//atributos
  final String name;
  final double temp;
  final double temp_max;
  final double temp_min;
  final String description;
  final String main;

//construtor
  Weather(
      {required this.name,
      required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.description,
      required this.main});

//métodos
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      temp: json['main']['temp'],
      temp_max: json['main']['temp_max'],
      temp_min: json['main']['temp_min'],
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
    );
  }
}
