import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controller/product/image_controller.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/app_bar/appbar.dart';
import '../../../../../common/widget/custome _shapes/curved_edges/curve_edges_widget.dart';
import '../../../../../common/widget/images/rounded_banner_image.dart';
import '../../../../../common/widget/products_card/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../model/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);

    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            ///-----------------------Main Large Image -------------------///
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: ()=> controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  })),
                )),

            ///---------------------- Image Slider-------------------------------------///
            Positioned(
              right: 1,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: TSizes.spaceBtwItems),
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx((){


                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return TRoundedImage(
                        isNetworkImage: true,
                        imageUrl: images[index],
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        onPressed: ()=> controller.selectedProductImage.value= images[index],
                        padding: EdgeInsets.all(TSizes.sm),
                        border: Border.all(color:imageSelected?TColors.primary:Colors.transparent ),
                      );
                    })),
              ),
            ),

             TAppBar(
              showBackArrow: true,
              action: [
                TFavouriteIcon(productId: product.id,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
