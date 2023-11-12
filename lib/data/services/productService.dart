import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/domain/models/products.dart';

class ProductService {
  //obtener productos
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://localhost:8080/api/products');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Error al obtener los productos');
    }
    return compute(convertirLista, response.body);
  }
  //crear producto
  static Future<Product> postProduct(Product product) async {
  var url = Uri.parse('http://localhost:8080/api/products');
  final response = await http.post(
    url,
    body: jsonEncode(product.toJson()), // Convierte el producto a JSON
    headers: {'Content-Type': 'application/json'}, // Establece el encabezado JSON
  );
  if (response.statusCode == 201) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al crear el producto');
  }
}


  static List<Product> convertirLista(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
    print(pasar);
    return pasar.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
