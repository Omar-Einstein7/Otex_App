import 'package:dartz/dartz.dart';

import 'package:optex_app/domain/home/entities/product.dart';



abstract class ProductRepository {
  Future<Either> getAllProducts();
  Future<Either> addProduct(Product product);
}