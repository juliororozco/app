class Product {
  final String? id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String reference;
  final double price;
  final double? oldPrice;
  final String description;
  final int? v;

  Product({
    this.id,
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
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      imageUrl: List<String>.from(json['imageUrl']?.map((x) => x) ?? []),
      reference: json['reference'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      description: json['description'] ?? '',
      v: json['__v'] as int?,
    );
  }

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
