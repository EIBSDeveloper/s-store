import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widget/app_bar/appbar.dart';
import '../../../../../common/widget/loaders/shimmers/shimmer.dart';
import '../../../../../common/widget/products_card/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color:TColors.grey)),
          Obx(() {
            if(controller.profileLoader.value){

              return const TShimmerEffect(width: 80, height: 15);
            }
          return  Text(controller.user.value.fullname, style: Theme
                .of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white));

          }
          )
        ],
      ),
      action: [
        TCartCounterIcon(iconColor: TColors.white)
      ],
    );
  }
}

