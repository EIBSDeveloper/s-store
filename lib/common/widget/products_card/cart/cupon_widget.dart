import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custome _shapes/container/rounded_container.dart';


class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showborder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          left: TSizes.md,
          right: TSizes.sm,
          top: TSizes.sm,
          bottom: TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),

          /// Apply Button

          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side:BorderSide(color: Colors.grey.withOpacity(0.1))
                ),
              ))
        ],
      ),
    );
  }
}
