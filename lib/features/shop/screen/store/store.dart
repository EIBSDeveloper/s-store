import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/search_container.dart';
import 'package:t_store/common/widget/products_card/cart/cart_menu_icon.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/controller/brand_controller.dart';
import 'package:t_store/features/shop/screen/brand/all_brands.dart';
import 'package:t_store/features/shop/screen/store/widget/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widget/app_bar/tabbar.dart';
import '../../../../common/widget/brand_cards/brand_cards.dart';
import '../../../../common/widget/layouts/grid_layout.dart';
import '../../../../common/widget/loaders/shimmers/brand_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/category_controller.dart';
import '../brand/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TCartCounterIcon(
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,

                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ///************************Search Bar **********************///
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showborder: true,
                          showbackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        ///************************Feature Brands Title **********************///
                        TSectionHeading(
                          title: 'Featured Brands',
                          onpressed: () {
                            Get.to(() => const AllBrandScreen());
                          },
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        ///******************************************Brands Condainers/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**//*/*/
                        Obx(() {
                          if (brandController.isLoading.value)
                            return const TBrandShimmer();
                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                                child: Text('No Data Found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                          color: Colors.white,
                                        )));
                          }
                          return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brands =
                                  brandController.featuredBrands[index];
                              print(
                                  'Brand ImageUrl ${brandController.featuredBrands[index].toJson()} - ${brandController.featuredBrands[index].name}');
                              return TBrandCard(
                                brand: brands,
                                onTap: () => Get.to(() => BrandProducts(
                                      brand: brands,
                                    )),
                                showborder: false,
                              );
                            },
                          );
                        })
                      ],
                    ),
                  ),

                  ///*/*/*/*/*/*/*/*/*/*/*/*/* Tab Bars /*/*/*/*/*/*/*/*/*/*/*/*/*/*
                  bottom: TTabBar(
                      tabs: categories
                          .map((categories) => Tab(
                                child: Text(categories.name),
                              ))
                          .toList()),
                )
              ];
            },

            ///*/*/*/*/*/*/*/*/*/*/*/*/* Tab Bars Views /*/*/*/*/*/*/*/*/*/*/*/*/*/*

            body: TabBarView(
                children: categories
                    .map((categories) => TCategoryTab(category: categories))
                    .toList())),
      ),
    );
  }
}
