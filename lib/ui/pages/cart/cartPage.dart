import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/cartController.dart';
import 'package:frontend/domain/models/cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = CartController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: FutureBuilder<Cart>(
        future: cartController
            .getCart('userId'), // Reemplaza 'userId' con el ID de usuario real
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.products.isEmpty) {
            return Center(child: Text('El carrito está vacío'));
          } else {
            final cart = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para procesar la compra
                      // Puedes redirigir a una pantalla de pago, por ejemplo
                      // cartController.processPurchase('userId');
                    },
                    child: Text('Procesar Compra'),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
