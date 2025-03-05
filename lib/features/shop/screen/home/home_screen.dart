import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/products_card/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controller/product/product_controller.dart';
import 'package:t_store/features/shop/screen/all_products/all_products.dart';
import 'package:t_store/features/shop/screen/home/widget/Home_circle_category.dart';
import 'package:t_store/features/shop/screen/home/widget/home_appbar.dart';
import 'package:t_store/features/shop/screen/home/widget/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/custome _shapes/container/primary_header_container.dart';
import '../../../../common/widget/custome _shapes/container/search_container.dart';
import '../../../../common/widget/layouts/grid_layout.dart';
import '../../../../common/widget/loaders/shimmers/product_vertical_shimmer.dart';
import '../../../../common/widget/texts/section_headings.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///------------------------ Header -------------------------///
            const TPrimaryHeadersContainer(
              child: Column(
                children: [
                  ///******************************** AppBar *****************************///
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///****************************** SearchBar ***************************///

                  TSearchContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///**************************** Categories ****************************///
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///----call Title---///
                        TSectionHeading(
                          title: 'Popular Categories',
                          showactionbutton: false,
                          textcolor: TColors.textWhite,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///------------------------Categories Circle & text-------------------------///
                        THomeCategory(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// ************************* Banner ***************************///
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///==================Heading=======================///

                  TSectionHeading(
                    title: 'Popular Products',
                    onpressed: () {
                      Get.to(() => AllProducts(title: 'Popular Products',featureMethod: controller.fetchAllFeatureProduct(),));
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ///************************* Product Card *************************///


                  Obx((){
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featureProducts.isEmpty){
                      return Center( child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium,),);
                    }
                    return   Obx(
                      ()=> TGridLayout(
                        itemCount: controller.featureProducts.length,
                        itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featureProducts[index],),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
