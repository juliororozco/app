import 'dart:convert';
import 'package:frontend/domain/models/users.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'http://localhost:8080/api';

  Future<String> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/signup'),
      body: json.encode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);

      // Almacena el token en SharedPreferences después de registrar al usuario
      await _saveToken(data['token']);

      return 'Usuario creado con éxito';
    } else {
      throw 'Error al crear el usuario';
    }
  }

  Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Almacena el token en SharedPreferences después de iniciar sesión
      await _saveToken(data['token']);
    } else if (response.statusCode == 401) {
      throw 'Email no registrado o contraseña incorrecta';
    } else {
      throw 'Error al iniciar sesión';
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
