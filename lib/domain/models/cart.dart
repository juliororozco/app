class CartItem {
  String cartItem;
  int quantity;

  CartItem({required this.cartItem, this.quantity = 1});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItem: json['cartItem'],
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItem'] = this.cartItem;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Cart {
  String userId;
  List<CartItem> products;

  Cart({required this.userId, required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<CartItem> productList = list.map((i) => CartItem.fromJson(i)).toList();

    return Cart(
      userId: json['userId'],
      products: productList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['products'] = this.products.map((e) => e.toJson()).toList();
    return data;
  }
}