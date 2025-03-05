import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/images/rounded_banner_image.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/controller/category_controller.dart';
import 'package:t_store/features/shop/model/category_model.dart';
import 'package:t_store/features/shop/screen/all_products/all_products.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/loaders/shimmers/product_horizandal_shimmer.dart';
import '../../../../common/widget/products_card/product_cards/product_card_horizondal.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  Scaffold(
      appBar:  TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Banner
              const TRoundedImage(imageUrl: TImages.banner4,width: double.infinity,applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections),

                ///Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  const loader = THorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;
                  final subCategories = snapshot.data!;
                 return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProducts( categoryId:subCategory.id,),
                          builder: (context, snapshot) {



                            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                            if(widget != null) return widget;
                            final products = snapshot.data!;

                            return Column(
                              children: [
                                TSectionHeading(title:subCategory.name,onpressed: (){
                                  Get.to(()=> AllProducts(title: subCategory.name,featureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),));
                                },),
                                const SizedBox(height: TSizes.spaceBtwItems/2),
                            
                                ///Product
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                      itemCount:products.length,
                                      separatorBuilder: (context,index)=>const SizedBox(width: TSizes.spaceBtwItems),
                                      itemBuilder:(context,index)=>  TProductCardHorizondal(product:products[index])),
                                )
                              ],
                            );
                          }
                        );
                      });

                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
