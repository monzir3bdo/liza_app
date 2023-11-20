import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:assignment_project/features/products/presentation/widgets/prouduct_quantity_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/font_style_manager.dart';
import '../../domain/entities/product.dart';

class ProudctNameWidget extends StatelessWidget {
  final Product product;
  const ProudctNameWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 4, bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  product.title,
                  style: FontManager.interMedium28.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
              Text(
                '\$ ${product.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
