import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';

import '../../../../../common/widget/products_card/cart/add_remove_button.dart';
import '../../../../../common/widget/products_card/cart/cart_item.dart';
import '../../../../../common/widget/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    ///Product Image,Title, prise, size
                    TCartItem(cartItem: item),

                    if (showAddRemoveButton)

                      ///Add and Minus Button
                      const SizedBox(height: TSizes.spaceBtwItems),
                    // if (showAddRemoveButton)
                    showAddRemoveButton?      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70),

                            ///Add and Minus Button
                            TProductQuantityWithAddRemove(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () =>
                                  cartController.removeOneFromCart(item),
                              showAddRemoveButton: showAddRemoveButton,
                            ),
                          ],
                        ),
                        TProductPriceText(
                            price: (item.price * item.quantity)
                                .toStringAsFixed(1)),
                      ],
                    ): Row(
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
              })),
    );
  }
}
