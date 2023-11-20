import 'package:flutter/material.dart';

import '../../../../core/font_style_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';

class ProductCategoryWidget extends StatelessWidget {
  final Product product;
  const ProductCategoryWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            AppStrings.category,
            style: FontManager.interSemiBold28.copyWith(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              product.category,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
