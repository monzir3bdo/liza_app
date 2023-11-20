import 'package:assignment_project/features/products/domain/entities/product.dart';
import 'package:assignment_project/features/products/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridViewWidget extends StatelessWidget {
  final void Function(int index)? onTap;
  final List<Product> products;
  const ProductsGridViewWidget({super.key, this.onTap, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10 / 16,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ProductWidget(product: products[index]);
      },
      itemCount: products.length,
    );
  }
}
