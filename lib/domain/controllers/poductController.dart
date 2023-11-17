import 'package:get/get.dart';
import 'package:frontend/data/services/productService.dart';
import 'package:frontend/domain/models/products.dart';

class ProductController extends GetxController {
  Rx<List<Product>> listaLocalP = Rx<List<Product>>([]);

  Future<void> listProducts() async {
    try {
      listaLocalP.value = await ProductService.getProducts();
      listaLocalP
          .refresh(); // Usar await para asegurar que la lista se actualice antes de continuar
    } catch (e) {
      print('Error al obtener la lista de productos: $e');
      // Muestra una notificación al usuario en caso de error
      Get.snackbar(
          'Error', 'No se pudieron cargar los productos. Detalles: $e');
    }
  }

  List<Product> get listaGeneralProduct => listaLocalP.value;

  Future<void> createProduct(Product product) async {
    try {
      final newProduct = await ProductService.postProduct(product);
      listaLocalP.value.add(newProduct);
      listaLocalP
          .refresh(); // Usar await para asegurar que la lista se actualice antes de continuar
      // Muestra una notificación al usuario después de crear el producto
      Get.snackbar('Éxito', 'Producto creado con éxito');
    } catch (e) {
      print('Error al crear el producto: $e');
      // Muestra una notificación al usuario en caso de error
      Get.snackbar('Error', 'No se pudo crear el producto. Detalles: $e');
    }
  }
}
