import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controller/product/variation_controller.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/features/shop/screen/cart/cart.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../../utils/constants/colors.dart';
import '../../model/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variable

  RxInt noOfCartItem = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  /// Add item in cart
  void addToCart(ProductModel product) {
    /// -- Quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: "Select Quantity");
      return;
    }

    /// -- Variation Selected
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: "Select Variation");
      return;
    }

    /// -- Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: "Selected variation is out of stock.");
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: "Selected Product is out of stock.");
        return;
      }
    }

    /// -- Convert the productModel to a CartItemModel with the given Quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    /// -- Check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      /// -- this quantity is already added or updated/removed from the design (cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: "Your Product has been added to the cart.");
  }

  void checkOutCart(ProductModel product) {
    /// -- Quantity Check
    // if (productQuantityInCart.value < 1) {
    //   TLoaders.customToast(message: "Select Quantity");
    //   return;
    // }

    /// -- Variation Selected
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: "Select Variation");
      return;
    }

    /// -- Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: "Selected variation is out of stock.");
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap!', message: "Selected Product is out of stock.");
        return;
      }
    }

    /// -- Convert the productModel to a CartItemModel with the given Quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    /// -- Check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      /// -- this quantity is already added or updated/removed from the design (cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();

    Get.to(() => const CartScreen());

    // Get.to(()=>SingleCheckoutScreen(product: product));
    // TLoaders.customToast(message: "Your Product has been added to the cart.");
  }

  /// This function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
// Reset Variation in case of single product type.
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Remove Product",
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you want to remove this product?',
      middleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
      barrierDismissible: false,
      radius: 8,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      textConfirm: "Remove",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      cancelTextColor: TColors.primary,
      buttonColor: TColors.primary,
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () {},
    );
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += ((item.price) * item.quantity).toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItem.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData(TTexts.lsCartItems, cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>(TTexts.lsCartItems);
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  updateAlreadyProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
