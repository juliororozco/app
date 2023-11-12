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

  void createProduct(BuildContext context) {
    final ProductController pc = Get.find<ProductController>();

    // Recopila los valores de los controladores
    final String name = nameController.text;
    final double price = double.tryParse(priceController.text) ?? 0.0;
    final String description = descriptionController.text;
    final String imageUrl = imageUrlController.text;
    final double oldPrice = double.tryParse(oldPriceController.text) ?? 0.0;
    final String reference = referenceController.text;

    // Crea un nuevo producto
    final newProduct = Product(
      id: '', // El ID se generará automáticamente por el servidor
      name: name,
      price: price,
      description: description,
      imageUrl: [imageUrl],
      oldPrice: oldPrice,
      reference: reference,
      v: 0, category: '',
    );

    // Llama al controlador para crear el producto
    pc.createProduct(newProduct);

    // Limpia los campos después de crear el producto
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    imageUrlController.clear();
    oldPriceController.clear();
    referenceController.clear();

    // Muestra un mensaje de éxito o redirige a otra pantalla
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto creado con éxito')),
    );
  }
}
