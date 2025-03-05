import 'package:flutter/material.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../model/order_model.dart';


class TOrderedPaymentSection extends StatelessWidget {
  const TOrderedPaymentSection({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(title: 'Payment Method',showactionbutton: false,),
          const SizedBox(height: TSizes.spaceBtwItems/2,),


              Text(order.paymentMethod,style: Theme.of(context).textTheme.bodyLarge,)
            ],
          );



  }
}
