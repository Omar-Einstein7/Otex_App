

import 'package:optex_app/domain/movie/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    super.id,
    required super.name,
    required super.price,
    super.categoryId,
    super.imageUrl,
  });
}
