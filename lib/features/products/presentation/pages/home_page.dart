import 'package:assignment_project/core/database/cache_helper.dart';
import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:assignment_project/features/products/presentation/pages/binnance_api_page.dart';
import 'package:assignment_project/features/products/presentation/pages/location_page.dart';
import 'package:assignment_project/features/products/presentation/widgets/products_grid_view_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/font_style_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';

import '../widgets/text_form_field_widget.dart';

final ProductsController productsController = Get.find<ProductsController>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Product> searchedProducts;
    final ProductsController productsController =
        Get.find<ProductsController>();

    return SafeArea(
      child: Scaffold(
        body: productsController.obx(
          (products) => HomeWidget(
            products: productsController.products,
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => const Center(
            child: Text('Error'),
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final List<Product> products;
  const HomeWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    String? address = Get.find<CacheHelper>().getData(key: 'location');
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const LocationPage());
                  },
                  icon: const Icon(CupertinoIcons.location_fill)),
              IconButton(
                onPressed: () {
                  Get.to(() => const BinnancePage());
                },
                icon: const Icon(CupertinoIcons.money_dollar_circle_fill),
                iconSize: 30,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                AppStrings.hello,
                style: FontManager.interSemiBold28,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(CupertinoIcons.location_fill),
                Expanded(
                  child: Text(
                    address ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FormFieldWidget(
            controller: _controller,
            onChangedFunction: (searchedItem) {
              productsController.productSearch(searchedItem);
            },
          ),
          GetBuilder(
            init: productsController,
            builder: (_) => ProductsGridViewWidget(
              products: _controller.text.isEmpty
                  ? products
                  : productsController.getSearchProductList(),
            ),
          ),
        ],
      ),
    );
  }
}
