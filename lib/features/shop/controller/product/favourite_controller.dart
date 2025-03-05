import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/model/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../../utils/constants/text_strings.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  /// variables
  final favourite = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  /// -- method to initialize favorite by reading from local storage
  void initFavourite() {
    final json = TLocalStorage.instance().readData(TTexts.lsFavoriteList);
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favourite.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favourite[productId] ?? false;
  }

  void toggledFavoriteProduct(String productId) {
    if (!favourite.containsKey(productId)) {
      favourite[productId] = true;
      saveFavoriteToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourite.remove(productId);
      saveFavoriteToStorage();
      favourite.refresh();
      TLoaders.customToast(message: 'Product has been removed to the Wishlist');
    }
  }

  void saveFavoriteToStorage() {
    final encodeFavorites = json.encode(favourite);
    TLocalStorage.instance().saveData(TTexts.lsFavoriteList, encodeFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavoriteProducts(favourite.keys.toList());
  }
}
