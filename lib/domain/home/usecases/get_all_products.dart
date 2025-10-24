import 'package:dartz/dartz.dart';

import 'package:optex_app/domain/home/repo/product.dart';
import '../../../core/usecases/usecase.dart';

import 'package:optex_app/di.dart';

class GetAllProducts extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getAllProducts();
  }
}