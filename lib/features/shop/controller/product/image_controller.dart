import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedProductImage = "".obs;

  List<String> getAllProductImage(ProductModel product) {
    /// use set to add unique URL only
    Set<String> images = {};

    /// load thumbnail image
    images.add(product.thumbnail);

    /// Assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    ///Get all image from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    /// Get all product variation images if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(fullscreenDialog: true, () => Dialog.fullscreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace *2,horizontal: TSizes.defaultSpace),
            child: CachedNetworkImage(imageUrl: image),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150,
              child: OutlinedButton(onPressed:()=>Get.back() , child: const Text('Close'),),
            ),
          )
        ],
      ),
    ));
  }
}
