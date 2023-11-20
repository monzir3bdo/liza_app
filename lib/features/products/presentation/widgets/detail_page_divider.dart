import 'package:flutter/material.dart';

class ProductDetailPageDivider extends StatelessWidget {
  const ProductDetailPageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 10,
      height: 2,
      thickness: 1,
      color: Colors.grey,
      endIndent: 10,
    );
  }
}
