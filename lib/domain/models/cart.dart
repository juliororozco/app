class Cart {
  String userId;
  List<CartItem> products;

  Cart({
    required this.userId,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      userId: json['userId'],
      products: (json['products'] as List<dynamic>)
          .map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': products.map((item) => item.toJson()).toList(),
    };
  }
}

class CartItem {
  String cartItem;
  int quantity;

  CartItem({
    required this.cartItem,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItem: json['cartItem'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItem': cartItem,
      'quantity': quantity,
    };
  }
}
