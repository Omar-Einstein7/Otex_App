import 'package:dartz/dartz.dart';
import 'package:optex_app/common/helper/mapper/product_mapper.dart';

import 'package:optex_app/data/movie/sources/product.dart';
import 'package:optex_app/domain/movie/entities/product.dart';
import 'package:optex_app/domain/movie/repo/product.dart';
import 'package:optex_app/di.dart';


class ProductRepositoryImpl implements ProductRepository {

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    final result = await sl<ProductLocalDataSource>().getAllProducts();
    return result.fold(
      (exception) => Left(exception),
      (productModels) => Right(productModels.map((model) => ProductMapper.toEntity(model)).toList()),
    );
  }

  @override
  Future<Either<Exception, void>> addProduct(Product product) async {
    return await sl<ProductLocalDataSource>().insertProduct(ProductMapper.fromEntity(product));
  }
}
