import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/model/brand_model.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loaders.dart';
import '../firebase_storage/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get Future Product
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      return snapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in Brand all get brand :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Get Brand based  Product
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      /// Query to get all documents where categoryId matches the provided category Id
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      /// Extract the brand Ids from Document
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['BrandId'] as String)
          .toList();

      /// Query to get all documents where categoryId matches the provided category Id
      if (brandIds.isEmpty) {
        // Return an empty list if there are no brand IDs
        return [];
      }
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      /// Extract brand names or other revelant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in Brand getBrandForCategory :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  /// Upload Brand to the Cloud Firebase
  Future<void> uploadDummyBrandData(List<BrandModel> brand) async {
    try {
      ///start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.dockerAnimation);

// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
      for (var brands in brand) {
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(brands.image);
// Upload Image and Get its URL
        final url = await storage.uploadImageData('Brands', file, brands.name);
// Assign URL to Category. image attribute
        brands.image = url;
// Store Category in Firestore
        await _db.collection("Brands").doc(brands.id).set(brands.toJson());

        print("Brand Repository ${brands.toJson()}");
      }
      TLoaders.successSnackBar(
          title: 'Upload Successfully',
          message: 'Brands are Upload Successfully');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
