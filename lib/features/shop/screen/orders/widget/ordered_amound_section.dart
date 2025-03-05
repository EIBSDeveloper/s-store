import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../model/order_model.dart';

class TOrderedAmountSection extends StatelessWidget {
  const TOrderedAmountSection({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {


    final subTotal = order.subTotal;
    return  Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${order.subTotal}',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${order.deliveryFees}',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2),
        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${order.totalTax}',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2),
        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${order.totalAmount}',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
