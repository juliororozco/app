class User {
  final String id; // Utiliza el campo _id de MongoDB
  final String name;
  final String email;
  final String password;
  final String department;
  final String city;
  final String direction;
  final bool isAdmin;

  User({
    required this.id, // Deja el campo _id como parte del modelo
    required this.name,
    required this.email,
    required this.password,
    required this.department,
    required this.city,
    required this.direction,
    required this.isAdmin,
  });

  // Factoría para convertir un mapa en una instancia de UserModel
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'], // Utilizar el campo _id de MongoDB
      name: json['name'],
      email: json['email'],
      password: json['password'],
      department: json['department'],
      city: json['city'],
      direction: json['direction'],
      isAdmin: json['isAdmin'],
    );
  }

  // Método para convertir el modelo en un mapa
  Map<String, dynamic> toJson() {
    return {
      '_id': id, // Utilizar _id en lugar de id si es necesario
      'name': name,
      'email': email,
      'password': password,
      'department': department,
      'city': city,
      'direction': direction,
      'isAdmin': isAdmin,
    };
  }
}
