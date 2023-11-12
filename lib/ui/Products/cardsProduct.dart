import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        child: Column(
          children: [
            Image.asset(
                ''), // Puedes reemplazar esto con la imagen de tu producto
            Text('Nombre del Producto'),
            Text('Precio: \$XX.XX'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Agregar al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
