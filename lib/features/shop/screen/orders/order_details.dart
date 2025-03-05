import 'package:flutter/material.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/features/shop/model/order_model.dart';
import 'package:t_store/features/shop/screen/orders/widget/order_items.dart';
import 'package:t_store/features/shop/screen/orders/widget/ordered_address_section.dart';
import 'package:t_store/features/shop/screen/orders/widget/ordered_amound_section.dart';
import 'package:t_store/features/shop/screen/orders/widget/ordered_payment_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widget/app_bar/appbar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    // final cartController = CartController.instance;
    // final subTotal = cartController.totalCartPrice.value;
    // final orderController = Get.put(OrderController());
    // final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'INR');
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// item in Cart
              TOrderedItems(
                order: order,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Ordered Section
              TRoundedContainer(
                showborder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    ///Pricing
                    TOrderedAmountSection(
                      order: order,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///paymentMethod
                    TOrderedPaymentSection(
                      order: order,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///Address
                    TOrderedAddressSection(
                      order: order,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
