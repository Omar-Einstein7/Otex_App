import 'package:optex_app/di.dart';
import 'package:optex_app/domain/movie/usecases/get_all_products.dart';
import 'package:optex_app/domain/movie/usecases/add_product.dart';
import 'package:optex_app/domain/movie/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
  
      final products = await sl<GetAllProducts>().call();
      products.fold(
            (error){
        emit(
          ProductError(error)
        );
      },
      (data){
        emit(
          ProductLoaded(products:  data)
        );
      }
      );
      
  
  }

  Future<void> addProduct(Product product) async {
    emit(ProductLoading());
    final result = await sl<AddProduct>().call(params: product);
    result.fold(
      (error) => emit(ProductError(error.toString())),
      (_) => fetchProducts(), // Refresh the product list after adding
    );
  }
}
