import 'dart:convert';

import 'package:assignment_project/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

import '../models/product_model.dart';

const String cachedProducts = "CACHED_PRODUCTS";

class ProductsLocalDataSources {
  final GetStorage box;
  ProductsLocalDataSources({required this.box});
  Future<Unit> cacheProducts(List<ProductModel> products) {
    final List productToJson = products
        .map<Map<String, dynamic>>((productModel) => productModel.toJson())
        .toList();
    box.write(cachedProducts, jsonEncode(productToJson));
    return Future.value(unit);
  }

  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = box.read(cachedProducts);
    if (jsonString != null) {
      final List decodedJson = jsonDecode(jsonString);
      final List<ProductModel> jsonToProductModel = decodedJson
          .map<ProductModel>(
              (jsonProduct) => ProductModel.fromJson(jsonProduct))
          .toList();
      return Future.value(jsonToProductModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
