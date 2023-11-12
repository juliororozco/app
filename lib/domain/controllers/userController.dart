import 'package:flutter/foundation.dart';
import 'package:frontend/data/services/authService.dart';
import 'package:frontend/domain/models/users.dart';

class UserController {
  final AuthService authService = AuthService();

  // Método para crear un usuario
  Future<String?> createUser(User user) async {
    try {
      final message = await authService.createUser(user);
      return message;
    } catch (error) {
      debugPrint('Error al crear usuario: $error');
      return null;
    }
  }

  // Método para iniciar sesión
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      // Llama al servicio para realizar el inicio de sesión
      await authService.loginUser(email, password);

      // Si necesitas obtener el token, puedes hacerlo llamando al método getToken del servicio
      // String? token = await authService.getToken();

      // Puedes hacer otras cosas relacionadas con el inicio de sesión aquí

      // Devuelve alguna información útil si es necesario
      return {'message': 'Inicio de sesión exitoso'};
    } catch (error) {
      debugPrint('Error al iniciar sesión: $error');
      return null;
    }
  }
}
