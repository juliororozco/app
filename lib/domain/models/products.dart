class Product {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String reference;
  final double price;
  final double? oldPrice;
  final String description;
  final int? v;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.reference,
    required this.price,
    this.oldPrice,
    required this.description,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      imageUrl: List<String>.from(json['imageUrl'].map((x) => x)),
      reference: json['reference'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice']?.toDouble(),
      description: json['description'],
      v: json['__v'],
    );
  }

  get numRatings => null;

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'imageUrl': List<dynamic>.from(imageUrl.map((x) => x)),
      'reference': reference,
      'price': price,
      'oldPrice': oldPrice,
      'description': description,
      '__v': v,
    };
  }
}
