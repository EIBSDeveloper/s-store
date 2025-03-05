import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/features/shop/controller/product/all_product_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

import '../../../../common/widget/loaders/shimmers/product_vertical_shimmer.dart';
import '../../../../common/widget/products_card/sortable_products/sortable_products.dart';
import '../../model/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.featureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? featureMethod;
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());
    return   Scaffold(
        appBar: TAppBar(
          title: Text(title),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(
              future: featureMethod??controller.fetchProductByQuery(query),
              builder: (context, snapshot) {

                const loader = TVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget != null) return widget;
                final products = snapshot.data!;
                return  TSortableProducts(products: products);
              }
            ),
          ),
        ),
    );
  }
}
