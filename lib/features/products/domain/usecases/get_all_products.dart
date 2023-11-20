import 'package:assignment_project/features/products/domain/repostories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product.dart';

class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts({required this.repository});
  Future<Either<Failure, List<Product>>> call() async {
    return repository.getAllProducts();
  }
}
