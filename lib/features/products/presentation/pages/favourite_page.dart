import 'package:assignment_project/core/widgets/custom_button.dart';
import 'package:assignment_project/features/products/domain/entities/product.dart';
import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:assignment_project/features/products/presentation/pages/product_detail_page.dart';
import 'package:assignment_project/features/products/presentation/widgets/app_bar_widget.dart';
import 'package:assignment_project/features/products/presentation/widgets/products_grid_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

ProductsController productsController = Get.find<ProductsController>();

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  productsController.getFavouriteProducts();
  var favouriteList = productsController.favouriteProducts;
  return Obx(
    () => favouriteList.value.isEmpty
        ? const Center(child: Text("No Favourite Items yet"))
        : Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavouriteList(products: favouriteList),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomButton(
                        onPressed: () {},
                        buttonText: 'Go To Cart',
                        height: 70,
                        width: 370),
                  ),
                )
              ],
            ),
          ),
  );
}

_buildAppBar() {
  return AppBar(
    leading: Text(''),
    title: const Text(
      'Favourite ',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
    centerTitle: true,
    elevation: 0,
  );
}

class FavouriteList extends StatelessWidget {
  final List<Product> products;
  const FavouriteList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailPage(product: products[index]));
            },
            child: FavouriteItem(product: products[index])),
        itemCount: products.length,
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  final Product product;
  const FavouriteItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        productsController.removeFromFavouriteList(product);
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(CupertinoIcons.delete_simple),
            backgroundColor: Colors.lightBlueAccent,
            message: 'Item Removed Successfully',
            duration: Duration(seconds: 1),
          ),
        );
      },
      key: const Key('product.id'),
      child: Container(
        width: 360,
        height: 130,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  product.image,
                  width: 70,
                  height: 90,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  product.title,
                  softWrap: true,
                )),
                Text('\$${product.price}'),
              ],
            ),
            const Divider(
              thickness: 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
