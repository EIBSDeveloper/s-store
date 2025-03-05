import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../features/shop/model/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../firebase_storage/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get Future Product
  Future<List<ProductModel>> getFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Get Future Product
  Future<List<ProductModel>> getAllFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Get product based on Query
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Get Favorite product based on Query
  Future<List<ProductModel>> getFavoriteProducts(
      List<String> productIds) async {
    try {
      final Snapshot = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return Snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Get product based on brand
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection("Products")
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection("Products")
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again1 ';
    }
  }

  /// Get product based on Category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final productCategoryQuery = limit == -1
          ? await _db
              .collection("ProductCategory")
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection("ProductCategory")
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      /// Extract the brand Ids from Document
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['ProductId'] as String)
          .toList();
      if (productIds.isEmpty) {
        return [];
      }

      /// Query to get all documents where categoryId matches the provided category Id
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      final products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error in product :${e.toString()}');
      throw 'something went wrong, please try again ';
    }
  }

  /// Upload dummy product data to the Cloud Firebase
  Future<void> uploadDummyProductData(List<ProductModel> products) async {
    try {
      /// Upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      /// Loop through each product
      for (var product in products) {
        /// Get image data Link from Local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        /// Upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        /// Assign URL to product. thumbnail attribute
        product.thumbnail = url;

        /// Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            /// Get image data Link from Local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            /// Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            /// Assign URL to product. thumbnail attribute
            imagesUrl.add(url);
            print('UPLOAD PRODUCT ID ${product.toJson()}');
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        // Upload Variation Images

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            /// Get image data Link from Local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            /// Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            /// Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        /// Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
        TLoaders.successSnackBar(title: 'PRODUCT Upload Successfully');
      }
    } on FirebaseException catch (e) {
      print('Error in product Upload');
      throw e.message!;
    }
  }
}
