import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/snackbars/loaders.dart';
import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/custome _shapes/container/rounded_container.dart';
import '../../../../common/widget/products_card/cart/cupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../controller/product/cart_controller.dart';
import '../../controller/product/order_controller.dart';
import '../../model/product_model.dart';
import '../../screen/checkout/widget/billing_address_section.dart';
import '../../screen/checkout/widget/billing_amound_section.dart';
import '../../screen/checkout/widget/billing_payment_section.dart';
import 'widget/single_product_checkout.dart';

class SingleCheckoutScreen extends StatelessWidget {
  const SingleCheckoutScreen({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

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

              TSingleProductItemCard(
                  product: product!), // Show the single product

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
              ? () => orderController.processOrder(
                  totalAmount,
                  double.parse(deliveryAmount),
                  double.parse(taxAmount),
                  subTotal)
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
