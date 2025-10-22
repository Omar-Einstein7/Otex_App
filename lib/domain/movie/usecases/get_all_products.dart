import 'package:dartz/dartz.dart';
import 'package:optex_app/di.dart';
import 'package:optex_app/domain/movie/entities/product.dart';
import 'package:optex_app/domain/movie/repo/product.dart';
import '../../../core/usecases/usecase.dart';


class GetAllProducts extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getAllProducts();
  }
}