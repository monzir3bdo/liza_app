import 'package:assignment_project/core/database/cache_helper.dart';
import 'package:assignment_project/core/network/network_info.dart';
import 'package:assignment_project/features/products/data/datasources/product_local_data_sources.dart';
import 'package:assignment_project/features/products/data/datasources/product_remote_data_sources.dart';
import 'package:assignment_project/features/products/data/repostories/products_repository_impl.dart';
import 'package:assignment_project/features/products/domain/usecases/get_all_products.dart';
import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/repostories/repository.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    //repositores
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        remoteDataSource: Get.find<ProductRemoteDataSource>(),
        localDataSources: Get.find<ProductsLocalDataSources>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );
    //usecases
    Get.lazyPut(
        () => GetAllProducts(repository: Get.find<ProductRepository>()));
    //dataSources
    Get.lazyPut(
      () => ProductRemoteDataSource(),
    );
    Get.lazyPut(() => ProductsLocalDataSources(box: Get.find<GetStorage>()));
    //external library
    Get.lazyPut(() => GetStorage());
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(
        connectionChecker: Get.find<InternetConnectionChecker>()));
    Get.lazyPut(() => InternetConnectionChecker());
    Get.put(ProductsController(getAllProducts: Get.find<GetAllProducts>()));
    Get.lazyPut<CacheHelper>(() => CacheHelper());
  }
}
