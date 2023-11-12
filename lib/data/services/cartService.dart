import 'dart:convert';
import 'package:frontend/domain/models/cart.dart';
import 'package:http/http.dart' as http;

class CartService {
  static const String _baseUrl =
      'http://localhost:8080/api/cart'; // Reemplaza 'tuPuerto' con el puerto correcto de tu servidor

  Future<void> addToCart(String userId, String cartItem, int quantity) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl'),
        body: json.encode({
          'userId': userId,
          'cartItem': cartItem,
          'quantity': quantity,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw 'Error al agregar productos al carrito';
      }
    } catch (error) {
      throw 'Error al agregar productos al carrito: $error';
    }
  }

  Future<Cart> getCart(String userId) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/find/$userId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Cart.fromJson(data);
      } else {
        throw 'Error al obtener el carrito de compras';
      }
    } catch (error) {
      throw 'Error al obtener el carrito de compras: $error';
    }
  }

  Future<void> deleteItem(String userId, String cartItemId) async {
    try {
      final response = await http
          .delete(Uri.parse('$_baseUrl/$cartItemId'));

      if (response.statusCode != 200) {
        throw 'Error al eliminar el producto del carrito';
      }
    } catch (error) {
      throw 'Error al eliminar el producto del carrito: $error';
    }
  }
}
