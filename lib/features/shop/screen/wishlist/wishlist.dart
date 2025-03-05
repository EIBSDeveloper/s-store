import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/icons/rounded_icon.dart';
import 'package:t_store/common/widget/loaders/animation_loaders.dart';
import 'package:t_store/features/shop/controller/product/favourite_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/layouts/grid_layout.dart';
import '../../../../common/widget/loaders/shimmers/product_vertical_shimmer.dart';
import '../../../../common/widget/products_card/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return  Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [TCircularIcon(icon:Iconsax.add,onPressed: () =>Get.offAll(NavigationMenu()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> FutureBuilder(
                  future:controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer(itemCount: 6,);

                    /// nothing found
                    final emptyWidget = TAnimationLoaderWidget(text: "Whoops! Wishlist is Empty...", animation: TImages.pencilAnimation,showAction: true,actionText: "Let's add some",onActionPressed: ()=> Get.offAll(()=>const NavigationMenu()) ,);
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                    if(widget != null) return widget;
                    final favoriteProducts = snapshot.data!;
                    return TGridLayout(itemCount: favoriteProducts.length,itemBuilder: (_,index)=>TProductCardVertical(product: favoriteProducts[index]));
                  }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
