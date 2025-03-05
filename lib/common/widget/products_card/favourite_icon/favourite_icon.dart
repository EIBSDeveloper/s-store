import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controller/product/favourite_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../icons/rounded_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key, required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(
      () {
          return TCircularIcon(
            icon: controller.isFavorite(productId)?Iconsax.heart5:Iconsax.heart,
            color: controller.isFavorite(productId)?TColors.red:null,
            onPressed: ()=> controller.toggledFavoriteProduct(productId),
          );
        }
    );
  }
}
