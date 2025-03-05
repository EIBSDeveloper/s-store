import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/loaders/shimmers/shimmer.dart';
import 'package:t_store/features/shop/screen/brand/brand_products.dart';

import '../../../features/shop/model/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custome _shapes/container/rounded_container.dart';
import 'brand_cards.dart';


class TBrandShowCases extends StatelessWidget {
  const TBrandShowCases({
    super.key, required this.images, required this.brand,
  });
  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showborder: true,
        backgroundColor: Colors.transparent,
        borderColor: TColors.darkGrey,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            ///Brand with Product and counts
             TBrandCard(showborder: true, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              children: images .map((images) => brandTopProductImageWidget(images, context)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image,context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        child:  CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,progressIndicatorBuilder: (context,url,downloadProgress)=>TShimmerEffect(width: 100, height: 100),
        errorWidget: (context,url,error)=>const Icon(Icons.error),
        ),
      ),
    );
  }
}
