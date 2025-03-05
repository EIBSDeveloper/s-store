import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/success_screen/sucess_screen.dart';
import 'package:t_store/data/repositories/authendication/authendication_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';
import 'package:t_store/features/shop/controller/product/checkout_controller.dart';
import 'package:t_store/features/shop/model/order_model.dart';
import 'package:t_store/navigation_menu.dart';

import '../../../../data/repositories/orders/order_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loaders.dart';
import '../../../../utils/snackbars/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// variable
  final isLoading = false.obs;
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());
  final RxList<OrderModel> orders = <OrderModel>[].obs;

  /// Fetch Orders
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      isLoading.value = true;
      final userOrders = await orderRepository.fetchUserOrders();
      // final dateWiseOrder = userOrders.sort((a, b) => a.orderDate.compareTo(b.orderDate));
      //
      // Sort orders by order date in descending order (most recent first)
      final dateWiseOrder = userOrders
        ..sort((a, b) => b.orderDate.compareTo(a.orderDate));
      return dateWiseOrder;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount, double deliveryFee, double taxFee,
      double subTotal) async {
    try {
// Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);
// Get user authentication Id
      final userId = AuthendicationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;
// Add Details
      final order = OrderModel(
// Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        subTotal: subTotal,
        totalTax: taxFee,
        deliveryFees: deliveryFee,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,

        /// Set Date as needed
        deliveryDate: DateTime.now().add(const Duration(days: 5)),
        items: cartController.cartItems.toList(),
      ); // OrderModel

      print("Order Upload : ${order.toJson()}");

      /// Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      /// Update the cart status
      cartController.clearCart();

      /// show success screen
      Get.offAll(() => SuccessScreen(
          image: TImages.orderCompleteAnimation,
          title: 'Payment Success!',
          subtitle: "Your Item will shipped soon!",
          onpressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      TLoaders.errorSnackBar(message: e.toString());
    }
  }
}
