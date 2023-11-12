import 'package:flutter/material.dart';
import 'package:frontend/ui/Home/menu.dart';
import 'package:frontend/ui/Products/listProduct.dart';
import 'package:frontend/ui/Products/newProduct.dart';
import 'package:frontend/ui/Products/searchProduct.dart';
import 'package:frontend/ui/pages/Users/login/login.dart';
import 'package:frontend/ui/pages/Users/perfil/perfil.dart';
import 'package:frontend/ui/pages/Users/signup.dart';
import 'package:frontend/ui/pages/cart/cartPage.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => Menu(),
        "/listproduct": (context) => const ProductList(
              category: '',
            ),
        "/cart": (context) => CartPage(),
        "/porfil": (context) => const ProfilePage(),
        "/search": (context) => ProductSearch(
              onSearch: (String) {
                key;
              },
            ),
        "/login": (context) => const Login(),
        "/signup": (context) => UserRegistrationView(),
        "/createProduct": (context) => CreateProduct(),
      },
    );
  }
}
