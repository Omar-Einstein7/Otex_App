class Product {
  final int? id;
  final String name;
  final double price;
  final int? categoryId;
  final String? imageUrl;

  Product({
    this.id,
    required this.name,
    required this.price,
    this.categoryId,
    this.imageUrl,
  });
}