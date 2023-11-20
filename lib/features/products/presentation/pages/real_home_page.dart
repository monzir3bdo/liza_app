import 'package:assignment_project/core/local_notification.dart';
import 'package:assignment_project/features/products/presentation/controller/products_controller.dart';
import 'package:assignment_project/features/products/presentation/pages/about_me_page.dart';
import 'package:assignment_project/features/products/presentation/pages/cart_page.dart';
import 'package:assignment_project/features/products/presentation/pages/favourite_page.dart';
import 'package:assignment_project/features/products/presentation/pages/home_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchPage extends StatelessWidget {
  SwitchPage({super.key});
  List pages = [
    const HomePage(),
    const CartPage(),
    const FavouritePage(),
    const AboutMePage(),
  ];
  @override
  Widget build(BuildContext context) {
    LocalNotificationService()
        .showNotificationAndroid('Welcome Back', 'Hello there');
    return Scaffold(
      body: GetBuilder(
        init: Get.find<ProductsController>(),
        builder: (_) =>
            pages[Get.find<ProductsController>().currentIndex.value],
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }
}

_buildNavigationBar() {
  return GetBuilder(
    init: Get.find<ProductsController>(),
    builder: (_) => CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.blueAccent,
      strokeColor: const Color(0x30040307),
      unSelectedColor: const Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: const Text('home'),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
        ),
        CustomNavigationBarItem(
          title: const Text('Favourite'),
          icon: const Icon(Icons.favorite_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          title: const Text('Profile'),
        ),
      ],
      currentIndex: Get.find<ProductsController>().currentIndex.value,
      onTap: (index) {
        Get.find<ProductsController>().bottomNavigationOnTap(index);
      },
    ),
  );
}
