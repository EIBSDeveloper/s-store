import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/model/payment_method_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../screen/checkout/widget/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel
      .empty()
      .obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.googlePay, name: "Google Pay");
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (_) =>
        SingleChildScrollView(
          child:Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TSectionHeading(title: "Select Payment Method",showactionbutton: false,),
                const SizedBox(height: TSizes.spaceBtwSections),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.googlePay, name: "Google Pay")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.paytm, name: "Paytm")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.paypal, name: "Paypal")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.applePay, name: "ApplePay")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.creditCard, name: "Credit Card")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.masterCard, name: "Master Card")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.visa, name: "visa")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.payStack, name: "Pay Stack")),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        )
    );
  }
}
