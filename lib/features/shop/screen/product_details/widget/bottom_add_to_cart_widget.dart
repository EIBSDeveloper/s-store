import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/icons/rounded_icon.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyProductCount( product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.lg),
            topRight: Radius.circular(TSizes.lg),
          )),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
                children: [
                   TCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: TColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed:()=> controller.productQuantityInCart.value <1? null: controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Text(controller.productQuantityInCart.value.toString(),style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                   TCircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: TColors.black,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed: ()=> controller.productQuantityInCart.value +=1,
                  ),
                ],
              ),


            ElevatedButton(onPressed: controller.productQuantityInCart<1 ? null :()=>controller.addToCart(product),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black)
            ),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
