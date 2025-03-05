import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/model/banner_model.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../firebase_storage/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  Future<void> uploadDummyBannerData(List<BannerModel> banners) async {
    try {
// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each banner
      for (var banner in banners) {
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
// Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.targetScreen);
// Assign URL to Category. image attribute
        banner.imageUrl = url;
// Store Category in Firestore
        await _db.collection("Banners").add(banner.toJson());
      }
      TLoaders.successSnackBar(title: "Banner Upload Completd");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again in Banner $e';
    }
  }
}
