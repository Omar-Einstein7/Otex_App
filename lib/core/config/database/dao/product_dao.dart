import 'package:optex_app/core/config/database/app_database.dart';
import 'package:dartz/dartz.dart';
import 'package:optex_app/domain/movie/entities/product.dart';
import 'package:optex_app/common/helper/mapper/product_mapper.dart';


abstract class ProductDao {
  Future<Either<Exception, List<Product>>> getAllProducts();
  Future<Either<Exception, Product>> getProductById(int id);
  Future<Either<Exception, void>> insertProduct(Product product);
  Future<Either<Exception, void>> updateProduct(Product product);
  Future<Either<Exception, void>> deleteProduct(int id);
}

class ProductDaoImpl implements ProductDao {
  final AppDatabase _appDatabase;

  ProductDaoImpl(this._appDatabase);

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    try {
      final db = await _appDatabase.database;
      final result = await db.query('products');
      return Right(result.map((e) => ProductMapper.toEntity(ProductMapper.fromMap(e))).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Product>> getProductById(int id) async {
    try {
      final db = await _appDatabase.database;
      final result = await db.query('products', where: 'id = ?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return Right(ProductMapper.toEntity(ProductMapper.fromMap(result.first)));
      } else {
        return Left(Exception('Product not found'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> insertProduct(Product product) async {
    try {
      final db = await _appDatabase.database;
      await db.insert('products', ProductMapper.toMap(product));
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> updateProduct(Product product) async {
    try {
      final db = await _appDatabase.database;
      await db.update('products', ProductMapper.toMap(product), where: 'id = ?', whereArgs: [product.id]);
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> deleteProduct(int id) async {
    try {
      final db = await _appDatabase.database;
      await db.delete('products', where: 'id = ?', whereArgs: [id]);
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}