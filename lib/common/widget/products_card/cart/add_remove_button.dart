import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/rounded_icon.dart';

class TProductQuantityWithAddRemove extends StatelessWidget {
  const TProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove, required this.showAddRemoveButton,
  });

  final int quantity;
  final VoidCallback? add, remove;
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(

      mainAxisSize: MainAxisSize.min,
      children: [
        if(showAddRemoveButton)
        TCircularIcon(
          icon: Iconsax.minus,
          iconSize: TSizes.md,
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
          color: dark ? TColors.white : TColors.black,
          width: 32,
          height: 32,
          onPressed: remove,
        ),
        if(showAddRemoveButton)
         const SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
         SizedBox(width: TSizes.spaceBtwItems),
        showAddRemoveButton?TCircularIcon(
          icon: Iconsax.add,
          iconSize: TSizes.md,
          backgroundColor: TColors.primary,
          width: 32,
          height: 32,
          color: TColors.white,
          onPressed: add,
        ):const TCircularIcon(
          icon: Icons.close,
          iconSize: TSizes.md,  // Smaller icon size to fit the small container
          backgroundColor: TColors.darkGrey,
          width: 28.0,  // Small container width
          height: 28.0,  // Small container height
          color: TColors.primary,
          onPressed: null,  // Action or null for disabled button
        ),
      ],
    );
  }
}
