import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authendication/authendication_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthendicationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. try again later';
      }

      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      return result.docs
          .map((doc) => AddressModel.fromDocumentSnapshot(doc))
          .toList();
    } catch (e) {
      print('fetchUserAddress ${e.toString()}');
      throw 'Something went wrong while fetching Address information, try again later';
    }
  }
  // Future<AddressModel> fetchDefaultUserAddress() async {
  //   try {
  //     final userId = AuthendicationRepository.instance.authUser!.uid;
  //     if (userId.isEmpty) {
  //       throw 'Unable to find user information. try again later';
  //     }
  //
  //     final result = await _db
  //         .collection("Users")
  //         .doc(userId)
  //         .collection("Addresses")
  //         .get();
  //     return result.;
  //   } catch (e) {
  //
  //     print('Update ${e.toString()}');
  //     throw 'Something went wrong while fetching Address information, try again later';
  //   }
  // }

  Future<void> updatedSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthendicationRepository.instance.authUser!.uid;

      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({"SelectedAddress": selected});
    } catch (e) {
      print('Select ${e.toString()}');
      throw 'Something went wrong while Selecting Address information, try again later';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthendicationRepository.instance.authUser!.uid;

      final currentAddress = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while Adding Address, try again later';
    }
  }
}
