import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../../utils/constants/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeatureProduct();
    super.onInit();
  }

  void fetchFeatureProduct() async {
    try {
      isLoading.value = true;

      /// Fetch Product
      final products = await productRepository.getFeaturedProduct();

      /// Assign Product
      featureProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeatureProduct() async {
    try {
      /// Fetch Product
      final products = await productRepository.getAllFeaturedProduct();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get Product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variations exists, return simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      /// Calculate the smallest and largest price among variation
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        /// Update the smallest price and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      /// If smallest price and largest price is equal then return single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        /// otherwise return price price
        return '$smallestPrice - ₹$largestPrice';
      }
    }
  }

  /// Calculate the Discount price
  String? calculateSalePercentage(double orginalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (orginalPrice <= 0) return null;

    double percentage = ((orginalPrice - salePrice) / orginalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
