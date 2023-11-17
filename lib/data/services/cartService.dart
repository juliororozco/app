import 'dart:convert';
import 'package:http/http.dart' as http;

class CartService {
  static const String baseUrl = 'http://localhost:8080/api/cart'; // Reemplaza con la URL de tu backend

  static Future<void> addToCart(String userId, String cartItem, int quantity) async {
    final String apiUrl = '$baseUrl';

    Map<String, dynamic> requestData = {
      'userId': userId,
      'cartItem': cartItem,
      'quantity': quantity,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Manejar la respuesta exitosa
      } else {
        // Manejar errores de respuesta
      }
    } catch (error) {
      // Manejar errores de red
    }
  }

  static Future<void> getCart(String userId) async {
    final String apiUrl = '$baseUrl/find?userId=$userId'; // Reemplaza con la URL de tu backend

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Manejar la respuesta exitosa
      } else {
        // Manejar errores de respuesta
      }
    } catch (error) {
      // Manejar errores de red
    }
  }

  static Future<void> deleteItem(String cartItemId) async {
    final String apiUrl = '$baseUrl/delete-item/$cartItemId'; // Reemplaza con la URL de tu backend

    try {
      var response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Manejar la respuesta exitosa
      } else {
        // Manejar errores de respuesta
      }
    } catch (error) {
      // Manejar errores de red
    }
  }
}