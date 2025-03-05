import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/features/shop/screen/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screen/product_details/widget/product_attributes.dart';
import 'package:t_store/features/shop/screen/product_details/widget/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screen/product_details/widget/product_meta_data.dart';
import 'package:t_store/features/shop/screen/product_details/widget/rating_and_share_widget.dart';
import 'package:t_store/features/shop/screen/product_review/product_review.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../controller/product/cart_controller.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(CartController());


    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(
        product: product,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image And Image Slider
            TProductImageSlider(product: product),

            /// Product Detailed
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Ratings & Share Button
                  const TRatingAndShare(),

                  ///Price,Title,Stock and Brand
                  TProductMetaData(product: product),

                  /// Attributes
                  if (product.productType == ProductType.variable.toString())
                    TProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: TSizes.spaceBtwSections),

                  /// CheckOut Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if(controller.productQuantityInCart.value<1){
                              print("111");
                              controller.productQuantityInCart.value +=1;
                              controller.checkOutCart(product);
                              print("1");

                            } else {
                              print("2");
                              controller.checkOutCart(product);
                            };
                            print(controller.productQuantityInCart);
                            // Get.to(() => CartScreen());
                            // controller.checkOutCart(product);
                            // Get.to(()=>CheckoutScreen(product: product));
                          },
                          child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Description
                  const TSectionHeading(
                    title: 'Description',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///Reviews
                  Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews (199)',
                        showactionbutton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewScreen());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
