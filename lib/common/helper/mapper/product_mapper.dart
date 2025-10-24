
import 'package:optex_app/data/home/models/product.dart';
import 'package:optex_app/domain/home/entities/product.dart';

class ProductMapper {
  static Product toEntity(ProductModel productModel) {
    return Product(
      id: productModel.id,
      name: productModel.name,
      price: productModel.price,
      categoryId: productModel.categoryId,
      imageUrl: productModel.imageUrl,
    );
  }

  static ProductModel fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      categoryId: product.categoryId,
      imageUrl: product.imageUrl,
    );
  }

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      price: map['price'] as double,
      categoryId: map['category_id'] as int?,
      imageUrl: map['image_url'] as String?,
    );
  }

  static Map<String, dynamic> toMap(Product product) {
    final map = {
      'name': product.name,
      'price': product.price,
      'category_id': product.categoryId,
      'image_url': product.imageUrl,
    };
    if (product.id != null) {
      map['id'] = product.id;
    }
    return map;
  }
}
