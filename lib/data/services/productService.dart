import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/domain/models/products.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://localhost:8080/api/products');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return compute(convertirLista, response.body);
        } else {
          return [];
        }
      } else {
        throw Exception('Error al obtener los productos. '
            'Código: ${response.statusCode}, Mensaje: ${response.body}');
      }
    } finally {
      // Cerrar la conexión después de su uso
      http.Client().close();
    }
  }

  static Future<Product> postProduct(Product product) async {
    var url = Uri.parse('http://localhost:8080/api/products');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(product.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        return Product.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error al crear el producto. '
            'Código: ${response.statusCode}, Mensaje: ${response.body}');
      }
    } finally {
      http.Client().close();
    }
  }

  static List<Product> convertirLista(String responseBody) {
    final parsedList = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedList.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
