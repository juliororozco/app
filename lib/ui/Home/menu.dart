import 'package:flutter/material.dart';
import 'package:frontend/ui/pages/cart/cartPage.dart';
import 'package:get/get.dart';
import 'package:frontend/ui/Products/listProduct.dart';
import 'package:frontend/data/services/authService.dart'; // Asegúrate de importar tu servicio

class Menu extends StatelessWidget {
  final AuthService _authService = AuthService(); // Instancia del servicio

  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mainColor = Colors.blue;
    const secondaryColor = Colors.white;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: AppBar(
              title: const Text('MotorCaribe'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Auteco'),
                  Tab(text: 'Bajaj'),
                  Tab(text: 'Suzuki'),
                ],
                indicatorColor: secondaryColor,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ProductList(category: 'Auteco'),
            ProductList(category: 'Bajaj'),
            ProductList(category: 'Suzuki'),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: secondaryColor),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: secondaryColor),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: secondaryColor),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: secondaryColor),
                label: 'Carrito',
              ),
            ],
            onTap: (index) async {
              switch (index) {
                case 0:
                  // Verifica si el usuario está autenticado antes de ir a /porfil
                  if (await _authService.getToken() != null) {
                    Get.toNamed('/porfil');
                  } else {
                    Get.toNamed('/login');
                  }
                  break;
                case 1:
                  Get.toNamed('/search');
                  break;
                case 2:
                  Get.toNamed('/login');
                  break;
                case 3:
                  if (await _authService.getToken() != null) {
                    // Muestra el carrito al tocar la opción
                    Get.to(CartPage());
                  } else {
                    Get.toNamed('/login');
                  }
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
