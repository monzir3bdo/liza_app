import 'package:assignment_project/features/products/presentation/widgets/product_category_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final Product product;
  const ProductDescriptionWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5, top: 10),
      child: Column(
        children: [
          Expanded(
            child: Text(
              product.description,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
          ProductCategoryWidget(product: product),
        ],
      ),
    );
  }
}
