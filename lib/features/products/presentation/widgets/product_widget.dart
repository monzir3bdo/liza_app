// ignore_for_file: must_be_immutable

import 'package:assignment_project/features/products/presentation/pages/product_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../controller/products_controller.dart';

class ProductWidget extends StatelessWidget {
  Function()? onTap;
  ProductWidget({
    super.key,
    required this.product,
    this.onTap,
  });

  final Product product;
  final ProductsController controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailPage(product: product));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(
          8,
          8,
          8,
          8,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black12,
            )),
        child: GridTile(
          footer: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.black54,
            ),
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.title,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' \$${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: GetBuilder(
                    builder: (ProductsController controller) => GestureDetector(
                      onTap: () {
                        controller.addOrDeleteFromFavourite(product);
                        controller.getFavouriteProducts();
                      },
                      child: product.isFavourite
                          ? const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                              size: 30,
                            )
                          : const Icon(
                              CupertinoIcons.heart,
                              color: Colors.red,
                              size: 30,
                            ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: product.id,
                child: FadeInImage.assetNetwork(
                  image: product.image,
                  width: 203,
                  height: 190,
                  fit: BoxFit.fill,
                  placeholder: 'assets/images/loading.gif',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
