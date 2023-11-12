import 'package:frontend/data/services/cartService.dart';
import 'package:frontend/domain/models/cart.dart';

class CartController {
  final CartService cartService = CartService();

  Future<void> addToCart(String userId, String cartItem, int quantity) async {
    try {
      await cartService.addToCart(userId, cartItem, quantity);
    } catch (error) {
      throw 'Error al agregar productos al carrito: $error';
    }
  }

  Future<Cart> getCart(String userId) async {
    try {
      return await cartService.getCart(userId);
    } catch (error) {
      throw 'Error al obtener el carrito de compras: $error';
    }
  }

  Future<void> deleteItem(String userId, String cartItemId) async {
    try {
      await cartService.deleteItem(userId, cartItemId);
    } catch (error) {
      throw 'Error al eliminar el producto del carrito: $error';
    }
  }
}
