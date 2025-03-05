import 'package:flutter/material.dart';
import 'package:t_store/features/shop/model/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_banner_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verify_icon.dart';



class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });

final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        TRoundedImage(imageUrl: cartItem.image ??'',
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
              TBrandTitleWithVerifyIcon(title: cartItem.brandName??''),
              Flexible(child: TProductTitleText(title: cartItem.title,maxline: 1,)),
              Text.rich(TextSpan(
                  children:(cartItem.selectedVariation?? {}).entries.map((e)=> TextSpan(
                    children: [
                      TextSpan(text: '${e.key}',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${e.value}',style: Theme.of(context).textTheme.bodyLarge)
                    ]
                  )).toList()
              ))
            ],
          ),
        )

      ],
    );
  }
}
