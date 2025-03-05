import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/model/brand_category_model.dart';
import 'package:t_store/features/shop/model/category_model.dart';
import 'package:t_store/features/shop/model/product_category_model.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../firebase_storage/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variable

  final _db = FirebaseFirestore.instance;

  /// Get All Categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyCategoriesData(List<CategoryModel> categories) async {
    try {
// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
      for (var category in categories) {
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);
// Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);
// Assign URL to Category. image attribute
        category.image = url;
// Store Category in Firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyBrandCategory(
      List<BrandCategoryModel> brandCategories) async {
    try {
// Upload all the Categories along with their Images

// Loop through each banner
      for (var brandCategory in brandCategories) {
// Store Category in Firestore
        await _db.collection("BrandCategory").add(brandCategory.toJson());

        print('BRAND CATEGORY: ${brandCategory.toJson()}');
      }

      TLoaders.successSnackBar(
          title: "Successfully", message: "Brand Category Upload Successfully");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  Future<void> uploadDummyProductCategory(
      List<ProductCategoryModel> productCategories) async {
    try {
// Upload all the Categories along with their Images

// Loop through each banner
      for (var productCategory in productCategories) {
// Store Category in Firestore
        await _db.collection("ProductCategory").add(productCategory.toJson());

        print('BRAND CATEGORY: ${productCategory.toJson()}');
      }

      TLoaders.successSnackBar(
          title: "Successfully", message: "Brand Category Upload Successfully");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
