import 'package:flutter/material.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/images/rounded_banner_image.dart';
import '../../../../../common/widget/texts/product_title_text.dart';
import '../../../../../common/widget/texts/t_brand_title_with_verify_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controller/product/variation_controller.dart';

class TSingleProductItemCard extends StatelessWidget {
  final ProductModel product;

  const TSingleProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final variationController = VariationController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TRoundedImage(imageUrl: product.thumbnail,
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: dark?TColors.darkGrey:TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems,),
        ///Title, prise, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifyIcon(title: product.brand!.name),
              Flexible(child: TProductTitleText(title: product.title,maxline: 1,)),
              Text(variationController.selectedVariation.toString().substring(1,variationController.selectedAttributes.toString().length-1),style: Theme.of(context).textTheme.bodySmall),

            ]
          ),
        )

      ],
    );
  }
}
