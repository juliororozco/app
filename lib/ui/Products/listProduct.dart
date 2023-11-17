import 'package:flutter/material.dart';
import 'package:frontend/data/services/authService.dart';
import 'package:frontend/domain/controllers/poductController.dart';
import 'package:frontend/domain/controllers/cartController.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required String category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.find();
    CartController cartController = Get.find();
    pc.listProducts();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 120.0,
            ),
            itemCount: pc.listaGeneralProduct.length,
            itemBuilder: (BuildContext context, int index) {
              final product = pc.listaGeneralProduct[index];

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                        ),
                        child: Image.network(
                          product.imageUrl[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            ' COP\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (product.oldPrice != null)
                            Text(
                              'Antes: \$${product.oldPrice?.toStringAsFixed(2)} COP',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () async {
                              // Obtener el token antes de agregar al carrito
                              AuthService authService = AuthService();
                              String? token = await authService.getToken();

                              if (token != null) {
                              } else {
                                // Mostrar mensaje o redirigir a pantalla de inicio de sesión si no hay token
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Inicia sesión para agregar al carrito')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                            child: const Text("Agregar al Carrito"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
