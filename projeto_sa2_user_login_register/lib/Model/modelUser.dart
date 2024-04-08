class modelUser {
  int ? id;
  String name;
  String email;
  String password;

  modelUser({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

    // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory modelUser.fromMap(Map<String, dynamic> map) {
    return modelUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

}
