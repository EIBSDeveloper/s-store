import 'package:flutter/material.dart';

import '../../../../../common/widget/texts/section_headings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../model/order_model.dart';

class TOrderedAddressSection extends StatelessWidget {
  const TOrderedAddressSection({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(title: 'Shipping Address',showactionbutton: false,),



          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.address!.name,style: Theme.of(context).textTheme.bodyLarge,),
              SizedBox(width: TSizes.spaceBtwItems/2),
              Row(
                children: [
                  Icon(Icons.phone,color: Colors.grey,size: 16,),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(order.address!.formattedPhoneNo,style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              Row(
                children: [
                  Icon(Icons.location_history,color: Colors.grey,size: 16,),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(child: Text(order.address!.toString(),style: Theme.of(context).textTheme.bodyMedium))
                ],
              ),
            ],
          )

        ],
      );

  }
}
