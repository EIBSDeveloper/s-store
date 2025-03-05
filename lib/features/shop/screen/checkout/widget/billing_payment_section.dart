import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/controller/product/checkout_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller =  CheckoutController.instance;
    return  Obx(
      ()=> Column(
        children: [
          TSectionHeading(title: 'Payment Method',buttontitle: 'Change',onpressed: ()=>controller.selectPaymentMethod(context),),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark?TColors.light:TColors.white,
                padding: EdgeInsets.all(TSizes.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(width: TSizes.spaceBtwItems/2),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),

        ],
      ),
    );
  }
}
