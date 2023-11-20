import 'package:assignment_project/core/errors/exceptions.dart';
import 'package:assignment_project/core/errors/failures.dart';
import 'package:assignment_project/core/network/network_info.dart';
import 'package:assignment_project/features/products/data/datasources/product_local_data_sources.dart';
import 'package:assignment_project/features/products/data/datasources/product_remote_data_sources.dart';
import 'package:assignment_project/features/products/domain/entities/product.dart';
import 'package:assignment_project/features/products/domain/repostories/repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductsLocalDataSources localDataSources;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSources,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getAllProducts();
        localDataSources.cacheProducts(products);
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSources.getCachedProducts();
        return Right(localProducts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
