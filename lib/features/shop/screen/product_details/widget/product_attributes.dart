import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/common/widget/texts/product_price_text.dart';
import 'package:t_store/common/widget/texts/product_title_text.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/controller/product/variation_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/chips/coice_chips.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../model/product_model.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
        ()=> Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  ///Title,Price and stock status
                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'Variation',
                        showactionbutton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price : ',
                                smallsize: true,
                              ),
                              // SizedBox(width: TSizes.spaceBtwItems,),

                              ///Actual Price (MRP)
                              if(controller.selectedVariation.value.salePrice>0)
                              Text(
                                '₹${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              if(controller.selectedVariation.value.salePrice>0)
                              const SizedBox(
                                width: TSizes.spaceBtwItems
                              ),

                              ///Sale Price
                               TProductPriceText(price:controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock : ',
                                smallsize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                   TProductTitleText(
                    title:
                       controller.selectedVariation.value.description ?? '',
                    smallsize: true,
                    maxline: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems
          ),

          ///Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map((attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSectionHeading(
                            title: attribute.name ?? '',
                            showactionbutton: false,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Obx(
                            () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;

                                final available = controller
                                    .getAttributesAvaliblityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);

                                return TChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList(),
                            ),
                          )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
