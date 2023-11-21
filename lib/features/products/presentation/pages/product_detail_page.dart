import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:assignment_project/features/products/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/product.dart';

import '../widgets/product_description_widget.dart';
import '../widgets/product_name_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  _buildAppBar(context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(() => const CartPage()),
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 500,
            height: 300,
            color: ColorsManager.white,
            child: Hero(
              tag: product.id,
              child: Image.network(
                product.image,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white38,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ProudctNameWidget(
                  product: product,
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ProductDescriptionWidget(product: product),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    Get.find<ProductsController>()
                        .addToCart(product, product.quantity);
                    Get.showSnackbar(
                      const GetSnackBar(
                        backgroundColor: Colors.lightBlueAccent,
                        message: 'Added Successfully',
                        duration: Duration(seconds: 1),
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  buttonText: AppStrings.addToCart,
                  height: 75,
                  width: 375,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductRatingWidget extends StatelessWidget {
  final Product product;

  const ProductRatingWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic rate = product.rating['rate'];
    final dynamic count = product.rating['count'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Review'),
        Text(rate.toString()),
        Text(count.toString()),
      ],
    );
  }
}
