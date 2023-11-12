import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/cartController.dart';
import 'package:frontend/domain/controllers/poductController.dart';
import 'package:frontend/domain/controllers/userController.dart';
import 'package:frontend/ui/app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put(ProductController());
  Get.put(UserController());
  Get.put(CartController());
}
