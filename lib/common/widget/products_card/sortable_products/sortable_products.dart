import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controller/product/all_product_controller.dart';

import '../../../../features/shop/model/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());

    controller.assignProduct(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {
          controller.sortProducts(value!);
            },
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList()
            ),

        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(()=> TGridLayout(itemCount:controller.products.length, itemBuilder: (_,index)=>TProductCardVertical(product: controller.products[index])))

      ],
    );
  }
}
