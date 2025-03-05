import 'package:flutter/material.dart';
import 'package:t_store/common/widget/brand_cards/brand_cards.dart';
import 'package:t_store/features/shop/controller/brand_controller.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/loaders/shimmers/product_vertical_shimmer.dart';
import '../../../../common/widget/products_card/sortable_products/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';
import '../../model/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {

    final controller = BrandController.instance;
    return Scaffold(
      appBar:  TAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showborder: true, brand:brand),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Filter Dropdown
              FutureBuilder(
                future:controller.getBrandProducts( brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;
                  final brandProducts = snapshot.data!;
                  return  TSortableProducts(
                    products: brandProducts,
                  );
                }
              ),


            ],
          ),
        ),
      ),
    );
    ;
  }
}
