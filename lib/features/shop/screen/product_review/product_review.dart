import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screen/product_review/widget/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screen/product_review/widget/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/products_card/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: const TAppBar(
        title: Text(
          'Reviews & Ratings',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Rating and reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems,),

              ///Overall Product Ratings

              TOverallProductRating(),
              TRatingBarIndigator(ratings: 4.6,),
              Text('12,688',style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),
              UserReviewCard(),
              UserReviewCard(),

              ///User Review List

            ],
          ),
        ),
      ),
    );
  }
}
