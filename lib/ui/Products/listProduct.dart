import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/poductController.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required String category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.find();
    pc.listProducts();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true, // Para que el GridView se ajuste al contenido
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Tres tarjetas por fila
              crossAxisSpacing: 8.0, // Espaciado horizontal
              mainAxisSpacing: 120.0, // Espaciado vertical
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
                        // ignore: prefer_const_constructors
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
                            onPressed: () {
                              // Agregar lógica para agregar al carrito aquí
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
