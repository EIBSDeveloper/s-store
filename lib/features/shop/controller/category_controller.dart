import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      /// Show loader while loading Categories
      isLoading.value = true;

      /// Fetch Categories from Data sourse(firebase,API,...etc)
      final categories = await _categoryRepository.getAllCategories();

      /// Update the Categories List
      allCategories.assignAll(categories);

      /// Filter Feature Categories
      featuredCategories.assignAll(allCategories
          .where(
              (category) => category.isFeatured! && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load Selected Category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);

      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(message: e.toString());
      return [];
    }
  }

  /// Get category or sub category product
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(message: e.toString());
      return [];
    }
  }
}
