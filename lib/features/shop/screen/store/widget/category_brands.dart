import 'package:flutter/material.dart';
import 'package:t_store/common/widget/loaders/shimmers/boxes_shimmer.dart';
import 'package:t_store/common/widget/loaders/shimmers/list_tile_shimmer.dart';
import 'package:t_store/features/shop/controller/brand_controller.dart';
import 'package:t_store/features/shop/model/category_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widget/brand_cards/brand_show_case.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategories(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListStyleShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems)
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(itemCount: brands.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_,index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts( brandId: brand.id,limit: 3),
              builder: (context, snapshot) {

                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return TBrandShowCases(
                  images: products.map((e)=>e.thumbnail).toList(), brand: brand,
                );
              }
            );
            },);
          // return TBrandShowCases(
          //   images: [
          //     TImages.productImage4,
          //     TImages.productImage5,
          //     TImages.productImage6,
          //   ],
          // );
        }
    );
  }
}
