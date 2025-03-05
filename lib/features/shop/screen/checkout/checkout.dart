import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';
import 'package:t_store/features/shop/screen/cart/widget/cart_items.dart';
import 'package:t_store/features/shop/screen/checkout/widget/billing_address_section.dart';
import 'package:t_store/features/shop/screen/checkout/widget/billing_amound_section.dart';
import 'package:t_store/features/shop/screen/checkout/widget/billing_payment_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/products_card/cart/cupon_widget.dart';
import '../../controller/product/order_controller.dart';
import '../../model/product_model.dart';

class CheckoutScreen extends StatelessWidget {
  final ProductModel? product;

  const CheckoutScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final addressController = Get.put(AddressController());
    final subTotal =
        product != null ? product!.price : cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());

    final double totalAmount =
        TPricingCalculator.calculateTotalPrice(subTotal, 'INR');
    final taxAmount = TPricingCalculator.calculateTax(subTotal, 'INR');
    final deliveryAmount =
        TPricingCalculator.calculateShippingCost(subTotal, 'INR');
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Show product details or cart items based on product parameter

              const TCartItems(
                  showAddRemoveButton:
                      false), // Show cart items for multiple products

              const SizedBox(height: TSizes.spaceBtwItems),

              /// Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Billing Section
              TRoundedContainer(
                showborder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () {
                  if (addressController.selectedAddress.value.id.isNotEmpty) {
                    orderController.processOrder(
                        totalAmount,
                        double.parse(deliveryAmount),
                        double.parse(taxAmount),
                        subTotal);
                  } else {
                    TLoaders.warningSnackBar(
                      title: 'Select Address',
                      message: 'Choose Address for delivery',
                    );
                  }
                }
              : () => TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add item in the cart in order to proceed.',
                  ),
          child: Text('Checkout  ₹$totalAmount'),
        ),
      ),
    );
  }
}
