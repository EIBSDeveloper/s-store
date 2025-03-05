import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/products_card/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/controller/category_controller.dart';
import 'package:t_store/features/shop/model/category_model.dart';
import 'package:t_store/features/shop/screen/all_products/all_products.dart';
import 'package:t_store/features/shop/screen/store/widget/category_brands.dart';

import '../../../../../common/widget/layouts/grid_layout.dart';
import '../../../../../common/widget/loaders/shimmers/product_vertical_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ////---Brands
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              TSectionHeading(
                title: "You might Like ",
                onpressed: () {
                  Get.to(() => AllProducts(
                        title: category.name,
                        featureMethod: controller.getCategoryProducts(
                            categoryId: category.id, limit: -1),
                      ));
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id,limit: 4),
                  builder: (context, snapshot) {
                    /// Loaders
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final categoryProducts = snapshot.data!;
                    return TGridLayout(
                      itemCount: categoryProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: categoryProducts[index]),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
