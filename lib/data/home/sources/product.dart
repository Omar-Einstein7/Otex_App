import 'package:dartz/dartz.dart';
import 'package:optex_app/common/helper/mapper/product_mapper.dart';
import 'package:optex_app/core/config/database/app_database.dart';
import 'package:optex_app/data/home/models/product.dart';



abstract class ProductLocalDataSource {
  Future<Either<Exception, List<ProductModel>>> getAllProducts();
  Future<Either<Exception, void>> insertProduct(ProductModel product);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<Either<Exception, List<ProductModel>>> getAllProducts() async {
    try {
      final db = await AppDatabase.instance.database;
      final result = await db.query('products');
      final products = result.map((e) => ProductMapper.fromMap(e)).toList();
      return Right(products);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> insertProduct(ProductModel product) async {
    try {
      final db = await AppDatabase.instance.database;
      await db.insert('products', ProductMapper.toMap(product));
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
