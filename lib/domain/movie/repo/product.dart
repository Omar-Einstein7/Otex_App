import 'package:dartz/dartz.dart';
import 'package:optex_app/domain/movie/entities/product.dart';



abstract class ProductRepository {
  Future<Either> getAllProducts();
  Future<Either> addProduct(Product product);
}