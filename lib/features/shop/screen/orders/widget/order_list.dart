import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/features/shop/controller/product/order_controller.dart';
import 'package:t_store/features/shop/screen/orders/order_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/loaders/animation_loaders.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = TAnimationLoaderWidget(
            text: "Whoops! Cart is EMPTY",
            animation: TImages.orderCompleteAnimation,
            showAction: true,
            actionText: "Let's Fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          ///   Helper Function : Handle Loader, no records or error message
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulation 😊 Your record Found
          final orders = snapshot.data!;
          return ListView.separated(
              itemCount: orders.length,
              separatorBuilder: (_, index) => SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                print('ORDERS DETAILS : ${order.toJson()}');
                return GestureDetector(
                  onTap: () => Get.to(() => OrderDetailsScreen(
                        order: order,
                      )),
                  child: TRoundedContainer(
                    showborder: true,
                    padding: EdgeInsets.all(TSizes.md),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Row 1
                        Row(
                          children: [
                            ///ICon
                            Icon(Iconsax.ship),
                            SizedBox(width: TSizes.spaceBtwItems / 2),

                            ///Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: TColors.primary,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(
                                    order.formattedOrderDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),

                            ///Icon
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.arrow_right_34,
                                  size: TSizes.iconSm,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// Row 2
                        Row(
                          children: [
                            ///ICon
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Iconsax.tag),
                                  SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  ///Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .apply(
                                                  color: TColors.primary,
                                                  fontWeightDelta: 1),
                                        ),
                                        Text(
                                          order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///ICon
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Iconsax.calendar),
                                  SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  ///Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Shipping Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .apply(
                                                  color: TColors.primary,
                                                  fontWeightDelta: 1),
                                        ),
                                        Text(
                                          order.formattedDeliveryDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///Icon
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
