import 'package:flutter/material.dart';
import 'package:t_store/common/widget/loaders/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, __) => SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),

              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
