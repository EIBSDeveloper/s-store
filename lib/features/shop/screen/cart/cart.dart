import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/common/widget/loaders/animation_loaders.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';
import 'package:t_store/features/shop/screen/cart/widget/cart_items.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        /// nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: "Whoops! Cart is EMPTY",
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: "Let's Fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),

      ///CheckOut Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox(width: 0, height: 0)
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(
                    () => Text('Checkout ${controller.totalCartPrice.value}')
                ),
              ),
            ),
    );
  }
}
