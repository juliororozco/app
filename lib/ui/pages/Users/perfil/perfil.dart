import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/7f/d8/a1/7fd8a1d9a9d55f78bc8474abf02e8dee.jpg'),
            radius: 60,
          ),
        ),
        const Text(
          'Julio Orozco Cuello',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ProfileOption(
          title: 'Órdenes',
          icon: Icons.shopping_cart,
          onTap: () {
            Get.toNamed('/orders'); // Navegar a la vista de órdenes
          },
        ),
        ProfileOption(
          title: 'Crear Producto',
          icon: Icons.add_circle,
          onTap: () {
            Get.toNamed(
                '/createProduct'); // Navegar a la vista de creación de productos
          },
        ),
        ProfileOption(
          title: 'Favoritos',
          icon: Icons.favorite,
          onTap: () {
            Get.toNamed('/favorites'); // Navegar a la vista de favoritos
          },
        ),
        const SizedBox(height: 20),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const ProfileOption(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
