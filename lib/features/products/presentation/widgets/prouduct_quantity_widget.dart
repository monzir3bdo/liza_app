import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';

class ProductQuantityWidget extends StatelessWidget {
  Product product;
  ProductQuantityWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();
    return GetBuilder(
      init: productsController,
      builder: (_) => Row(
        children: [
          GestureDetector(
            onTap: () {
              productsController.decreaseProductQuantity(product);
              print('decrease an item');
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Color(0xffE2E2E2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text('${product.quantity}')),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              productsController.increaseProductQuantity(product);

              print(product.quantity);
            },
            child: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
