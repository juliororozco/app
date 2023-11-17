import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/poductController.dart';
import 'package:frontend/domain/models/products.dart';
import 'package:get/get.dart';

class CreateProduct extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController oldPriceController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController categoryController =
      TextEditingController(); // Agregado

  CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(labelText: 'Nombre del Producto'),
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextFormField(
                controller: imageUrlController,
                decoration:
                    const InputDecoration(labelText: 'URL de la Imagen'),
              ),
              TextFormField(
                controller: oldPriceController,
                decoration: const InputDecoration(labelText: 'Precio Anterior'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: referenceController,
                decoration: const InputDecoration(labelText: 'Referencia'),
              ),
              TextFormField(
                // Agregado
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Categoría'),
              ),
              ElevatedButton(
                onPressed: () {
                  createProduct(context);
                },
                child: const Text('Crear Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createProduct(BuildContext context) async {
    final ProductController pc = Get.find<ProductController>();

    // Recopila los valores de los controladores
    final String name = nameController.text;
    final double price = double.tryParse(priceController.text) ?? 0.0;
    final String description = descriptionController.text;
    final String imageUrl = imageUrlController.text;
    final double oldPrice = double.tryParse(oldPriceController.text) ?? 0.0;
    final String reference = referenceController.text;
    final String category = categoryController.text; // Agregado

    // Crea un nuevo producto
    final newProduct = Product(
      id: '', // o puedes simplemente omitir este campo
      name: name,
      price: price,
      description: description,
      imageUrl: [imageUrl],
      oldPrice: oldPrice,
      reference: reference,
      v: 0,
      category: category,
    );

    // Llama al controlador para crear el producto
    await pc.createProduct(newProduct);

    // Limpia los campos después de crear el producto
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    imageUrlController.clear();
    oldPriceController.clear();
    referenceController.clear();
    categoryController.clear(); // Agregado

    // Redirige al usuario al home después de crear el producto
    Get.offAllNamed('/home');

    // Muestra un mensaje de éxito
    Get.snackbar('Éxito', 'Producto creado con éxito');
  }
}
