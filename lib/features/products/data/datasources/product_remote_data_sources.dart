import 'package:assignment_project/core/errors/failures.dart';
import 'package:assignment_project/features/products/data/models/product_model.dart';
import 'package:get/get.dart';

const String baseUrl = 'https://fakestoreapi.com';

class ProductRemoteDataSource extends GetConnect {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await get('$baseUrl/products');
    if (response.statusCode == 200) {
      final jsonData = response.body as List;
      final List<ProductModel> products = jsonData
          .map<ProductModel>(
              (jsonProductModel) => ProductModel.fromJson(jsonProductModel))
          .toList();
      return products;
    } else {
      throw ServerFailure();
    }
  }
}
