import 'package:flutter/material.dart';
import 'package:t_store/common/widget/images/t_circular_image.dart';
import 'package:t_store/common/widget/texts/product_price_text.dart';
import 'package:t_store/common/widget/texts/product_title_text.dart';
import 'package:t_store/common/widget/texts/t_brand_title_with_verify_icon.dart';
import 'package:t_store/features/shop/controller/product/product_controller.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/custome _shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {

    final controller = ProductController.instance;

    final salePercentage =  controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale price
        Row(
          children: [
            if(salePercentage!=null)
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding:  EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
               '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            if(salePercentage!=null)
            SizedBox(width: TSizes.spaceBtwItems,),

            ///Strike Price (MRP)
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
             Text('₹${product.price}',style: Theme.of(context).textTheme.titleSmall?.apply(decoration: TextDecoration.lineThrough),),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0) SizedBox(width: TSizes.spaceBtwItems,),
            ///Price
            TProductPriceText(price: controller.getProductPrice(product),islarge:true),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/1.5,),
        ///Title
        TProductTitleText(title: product.title),
        SizedBox(height: TSizes.spaceBtwItems/1.5,),

        ///Stock status
        Row(
          children: [
            TProductTitleText(title: 'status'),
            SizedBox(width: TSizes.spaceBtwItems),

            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        
        ///Brant Title
        Row(
          children: [
            TCircularImage(
              image:product.brand!= null? product.brand!.image:'',isNetworkImage: false,
              width: 52,
              height: 52,
              overlayColor: dark?TColors.white:TColors.black,),
              TBrandTitleWithVerifyIcon(title: product.brand!= null? product.brand!.name:'',brandTextSizes: TextSizes.medium,),
          ],
        )

        ],
    );
  }
}
