import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authendication/authendication_repository.dart';

import '../../../features/shop/model/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

/* FUNCTIONS*/

  /// Get all order related to current User
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthendicationRepository.instance.authUser!.uid;
      if (userId
          .isEmpty) throw 'Unable to find user information. Try again in few minutes.';
      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
final userOrders =result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();

      return userOrders;
    } catch (e) {
      print('Fetching User Order : ${e.toString()}');
    throw 'Something went wrong while fetching Order Information. Try again later ${e.toString()}';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }
}