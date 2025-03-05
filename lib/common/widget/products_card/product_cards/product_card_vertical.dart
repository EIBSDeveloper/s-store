import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/style/shadows.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/common/widget/images/rounded_banner_image.dart';
import 'package:t_store/features/shop/controller/product/product_controller.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/features/shop/screen/product_details/product_details.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verify_icon.dart';
import '../favourite_icon/favourite_icon.dart';
import 'add_to_cart_button.dart';

class TProductCardVertical extends StatelessWidget {
  const   TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product,)),
      child: Container(
          width: 180.0,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [TShawdowStyle.verticalbordershowdow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white,
          ),
          child: Column(
            children: [
              ///==================== Product Card =========================///
              ///******************** product image,discount tag,heart button ****************///
              TRoundedContainer(
                height: 170,
                width: 180,
                padding: const EdgeInsets.all(TSizes.sm),

                backgroundColor: dark ? TColors.dark : TColors.light,
                child: Stack(
                  children: [
                    ///----------------------Product Image ---------------------///
                    Center(
                      child: TRoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),

                    ///--------------------- Discounded Price tag-------------------///

                   if(salePercentage!=null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          "$salePercentage%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),

                    ///-------------------Heart Icon ---------------////
                     Positioned(
                        right: 0,
                        top: 0,
                        child: TFavouriteIcon(productId: product.id,))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallsize: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifyIcon(
                        title: product.brand!.name,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Price

                  Flexible(
                    child: Column(
                      children: [
                        if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(left:TSizes.sm),
                            child: Text(product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.sm),
                            child: TProductPriceText(
                              price: controller.getProductPrice(product),
                            ),
                          ),
                      ],
                    ),
                  ),

                  ///Product  Add Icon
                   ProductCartAddToCartButton(product: product)
                ],
              )
            ],
          )),
    );
  }
}
