import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controller/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widget/custome _shapes/container/circular_container.dart';
import '../../../../../common/widget/images/rounded_banner_image.dart';
import '../../../../../common/widget/loaders/shimmers/shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
    () {
      if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);
      if(controller.banners.isEmpty){
        return const Center(child: Text('No Data Found!'),);
      }
      else{
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  // autoPlayInterval: const Duration(seconds: 1),
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircularCointainer(
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                ],
              ),
            )
          ],
        );
      }
    }
    );
  }
}
