import 'package:dartz/dartz.dart';
import 'package:optex_app/core/usecases/usecase.dart';
import 'package:optex_app/di.dart';

import 'package:optex_app/domain/movie/repo/product.dart';

class AddProduct extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
       return await sl<ProductRepository>().addProduct(params);
  }
}