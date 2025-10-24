import 'package:get_it/get_it.dart';
import 'package:optex_app/data/home/repo/product_impl.dart';
import 'package:optex_app/data/home/sources/product.dart';
import 'package:optex_app/data/profile/repo/plan_repository_impl.dart';
import 'package:optex_app/domain/home/repo/product.dart';
import 'package:optex_app/domain/home/usecases/get_all_products.dart';
import 'package:optex_app/domain/home/usecases/add_product.dart';
import 'package:optex_app/domain/profile/repo/plan_repo.dart';
import 'package:optex_app/domain/profile/usecases/select_plan_usecase.dart';
import 'package:optex_app/presentation/home/bloc/product_cubit.dart';
import 'package:optex_app/common/bloc/locale_cubit.dart';
import 'package:optex_app/presentation/profile/bloc/plan_cubit.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
 // Data Source
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());

  // Repository
  sl.registerLazySingleton<ProductRepository>(()=> ProductRepositoryImpl());
    sl.registerLazySingleton<PlanRepository>(() => PlanRepositoryImpl());



  // UseCase
  sl.registerLazySingleton(() => GetAllProducts());
  sl.registerLazySingleton(() => AddProduct());
   sl.registerLazySingleton(() => GetPlansUseCase());

  //cubit
  sl.registerLazySingleton<ProductCubit>(()=>ProductCubit());
  sl.registerLazySingleton(() => LocaleCubit());
  sl.registerFactory(() => PlanCubit());
  
}
