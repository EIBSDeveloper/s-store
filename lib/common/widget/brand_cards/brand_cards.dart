import 'package:flutter/material.dart';
import 'package:t_store/features/shop/model/brand_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../custome _shapes/container/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_with_verify_icon.dart';


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showborder, this.onTap, required this.brand,
  });
  final bool showborder;
  final void Function()? onTap;
  final BrandModel brand;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap:onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showborder: showborder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// ------------------Icon-----------------------///////
            Flexible(
              child: TCircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: dark?TColors.white:TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),

            ///-------------------Text------------------------///
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TBrandTitleWithVerifyIcon(
                    title:brand.name,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text('${brand.productsCount??0} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
