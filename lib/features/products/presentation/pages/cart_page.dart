import 'package:assignment_project/core/widgets/custom_button.dart';
import 'package:assignment_project/features/products/domain/entities/product.dart';
import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';

import 'package:assignment_project/features/products/presentation/widgets/prouduct_quantity_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../invoice/pdf_invoice.dart';

ProductsController productsController = Get.find<ProductsController>();

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  List<Product> cartList = productsController.cartProducts;

  return GetBuilder(
    init: productsController,
    builder: (_) => cartList.isEmpty
        ? const Center(child: Text("No Items yet"))
        : Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavouriteList(products: cartList),
                Container(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 20),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Price:'),
                          Text(
                            ' ${productsController.calculateCartPrice()}',
                          ),
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      onPressed: () async {
                        // opening the pdf file
                        final pdf = await PdfInvoice(
                                totalPrice:
                                    productsController.calculateCartPrice(),
                                products: productsController.cartProducts)
                            .createPdf();
                        PdfInvoice.openFile(pdf);
                      },
                      buttonText: 'Go To Checkout',
                      height: 70,
                      width: 370),
                )
              ],
            ),
          ),
  );
}

_buildAppBar() {
  return AppBar(
    title: const Text(
      'My Cart ',
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
        itemBuilder: (context, index) =>
            FavouriteItem(product: products[index]),
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
    return GetBuilder(
      init: productsController,
      builder: (_) => Dismissible(
        onDismissed: (direction) {
          Get.showSnackbar(
            const GetSnackBar(
              icon: Icon(CupertinoIcons.delete_simple),
              backgroundColor: Colors.lightBlueAccent,
              message: 'Item Removed Successfully',
              duration: Duration(seconds: 1),
            ),
          );
          productsController.removeFromCart(product);
        },
        key: const Key('product.id'),
        child: Container(
          width: 390,
          height: 127,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    product.image,
                    width: 80,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            product.title,
                            softWrap: true,
                          ),
                        ),
                        ProductQuantityWidget(product: product),
                      ],
                    ),
                  ),
                  Text('\$ ${product.price}'),
                ],
              ),
              const Divider(
                thickness: 0.4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
