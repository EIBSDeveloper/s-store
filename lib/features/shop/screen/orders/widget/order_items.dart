import 'package:flutter/material.dart';
import 'package:t_store/features/shop/model/order_model.dart';

import '../../../../../common/widget/products_card/cart/cart_item.dart';
import '../../../../../common/widget/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TOrderedItems extends StatelessWidget {
  const TOrderedItems({
    super.key,
     required this.order,
  });

  final OrderModel order;


  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount:order.items.length,
          itemBuilder: (_, index) {
                final item = order.items[index];
                return Column(
                  children: [
                    ///Product Image,Title, prise, size
                    TCartItem(cartItem: item),



                      ///Add and Minus Button
                      const SizedBox(height: TSizes.spaceBtwItems),
                    // if (showAddRemoveButton)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        TProductPriceText(currencysign: '',
                            price:item.quantity.toString()),
                        SizedBox(width: 20),
                        Text("*"),
                        SizedBox(width: 20),
                        TProductPriceText(
                            price: (item.price * item.quantity)
                                .toStringAsFixed(1)),
                      ],
                    ),
                  ],
                );
              }

    );

  }
}
