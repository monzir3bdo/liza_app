import 'package:assignment_project/features/products/domain/entities/product.dart';
import 'package:assignment_project/features/products/domain/usecases/get_all_products.dart';
import 'package:get/get.dart';

import '../../../../core/errors/failures.dart';

class ProductsController extends GetxController with StateMixin {
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  final products = RxList<Product>.empty(growable: true);
  var favouriteProducts = RxList<Product>.empty(growable: true);
  final cartProducts = RxList<Product>.empty(growable: true);
  final GetAllProducts getAllProducts;
  var currentIndex = 0.obs;

  ProductsController({required this.getAllProducts});

  getProducts() async {
    change(products, status: RxStatus.loading());
    final productsOrFailure = await getAllProducts();
    productsOrFailure.fold(
      (failure) {
        change(products,
            status: RxStatus.error(_mapFailureToStringMessage(failure)));
      },
      (productsList) {
        products.addAll(productsList);
        change(products, status: RxStatus.success());
      },
    );
  }

  addOrDeleteFromFavourite(Product product) {
    product.isFavourite = !product.isFavourite;
    getFavouriteProducts();
    update();
  }

  getFavouriteProducts() {
    favouriteProducts.value =
        products.where((product) => product.isFavourite).toList();
  }

  removeFromFavouriteList(Product product) {
    favouriteProducts.remove(product);
    product.isFavourite = false;
    update();
  }

  addToCart(Product product, int quantity) {
    if (cartProducts.contains(product)) {
      product.quantity++;
    } else {
      cartProducts.add(product);
    }
  }

  void removeFromCart(Product product) {
    product.quantity = 1;
    cartProducts.remove(product);

    update();
  }

  void bottomNavigationOnTap(int newIndex) {
    currentIndex.value = newIndex;
    update();
  }

  String calculateCartPrice() {
    double totalPrice = 0;
    for (var product in cartProducts) {
      if (product.quantity > 0) {
        var itemWithQuantity = product.quantity * product.price;
        totalPrice += itemWithQuantity.toDouble();
      }
    }
    return totalPrice.toStringAsFixed(3);
  }

  void increaseProductQuantity(Product product) {
    product.quantity++;
    update();
  }

  decreaseProductQuantity(Product product) {
    if (product.quantity > 0) {
      product.quantity--;
    } else {
      product.quantity = 0;
    }

    update();
  }

  String _mapFailureToStringMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'There is a problem with server';
      case OfflineFailure:
        return 'Check your internet connection...';
      default:
        return 'Some error ... please try again later';
    }
  }
}
