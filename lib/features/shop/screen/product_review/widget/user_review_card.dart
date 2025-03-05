import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/rounded_container.dart';
import 'package:t_store/common/widget/products_card/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage2),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe',style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        ///Reviews
        Row(
          children: [
            const TRatingBarIndigator(ratings: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('08-Nov-2024',style: Theme.of(context).textTheme.bodyMedium,)

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText('This Product is awesome and its very smooth when i walk are run, its witeless. one of the best product from Nike worth for money ',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: ' Show less',
        trimCollapsedText: ' Show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        ///Company Review
        TRoundedContainer(
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          child: Padding( padding: EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('T Store',style: Theme.of(context).textTheme.titleMedium,),
                  Text('08-Nov-2024',style: Theme.of(context).textTheme.bodyMedium,)

                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ReadMoreText('This Product is awesome and its very smooth when i walk are run, its witeless. one of the best product from Nike worth for money ',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: ' Show less',
                trimCollapsedText: ' Show more',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
              ),


            ],
          ),
          ),


        ),
        const SizedBox(height: TSizes.spaceBtwSections,),



      ],
    );
  }
}
