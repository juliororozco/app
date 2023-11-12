import 'package:get/get.dart';
import 'package:frontend/data/services/productService.dart';
import 'package:frontend/domain/models/products.dart';

class ProductController extends GetxController {
  Rx<List<Product>> listaLocalP = Rx<List<Product>>([]);

  Future<void> listProducts() async {
    listaLocalP.value = await ProductService.getProducts();
    listaLocalP.refresh();
    print(listaLocalP.value);
  }

  List<Product> get listaGeneralProduct => listaLocalP.value;

  Future<void> createProduct(Product product) async {
    // Llama al servicio para crear un nuevo producto
    try {
      final newProduct = await ProductService.postProduct(product);
      listaLocalP.value
          .add(newProduct); // Agrega el nuevo producto a la lista local
      listaLocalP.refresh();
    } catch (e) {
      print('Error al crear el producto: $e');
    }
  }

}
