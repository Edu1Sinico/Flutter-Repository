class City {
  // Atributos
  final String name;
  final bool favorite;

  // Construtor
  City({required this.name, required this.favorite});
  
  // Métodos

  // Método para salvar as informações no banco
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'favorite': favorite,
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      name: map['name'],
      favorite: map['favorite'],
    );
  }
}