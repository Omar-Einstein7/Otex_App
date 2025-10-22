import 'package:get_it/get_it.dart';
import 'package:optex_app/data/movie/repo/product_impl.dart';
import 'package:optex_app/data/movie/sources/product.dart';
import 'package:optex_app/domain/movie/repo/product.dart';
import 'package:optex_app/domain/movie/usecases/get_all_products.dart';
import 'package:optex_app/domain/movie/usecases/add_product.dart';
import 'package:optex_app/presentation/home/bloc/product_cubit.dart';
import 'package:optex_app/common/bloc/locale_cubit.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
 // Data Source
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());

  // Repository
  sl.registerLazySingleton<ProductRepository>(()=> ProductRepositoryImpl());


  // UseCase
  sl.registerLazySingleton(() => GetAllProducts());
  sl.registerLazySingleton(() => AddProduct());

  //cubit
  sl.registerLazySingleton<ProductCubit>(()=>ProductCubit());
  sl.registerLazySingleton(() => LocaleCubit());
}
