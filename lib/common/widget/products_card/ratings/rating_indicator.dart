import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';


class TRatingBarIndigator extends StatelessWidget {
  const TRatingBarIndigator({
    super.key, required this.ratings,
  });
  final double ratings;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: ratings,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => Icon(Iconsax.star1, color: TColors.primary,),
    );
  }
}
