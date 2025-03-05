import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/models/address_model.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double subTotal;
  final double? totalTax;
  final double? deliveryFees;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.subTotal,
    this.totalTax,
    this.deliveryFees,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Google Pay',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  // Convert the OrderModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString().split('.').last, // Convert enum to string
      'subTotal': subTotal,
      'totalTax': totalTax,
      'deliveryFees': deliveryFees,
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(), // Assuming AddressModel has toJson
      'deliveryDate': deliveryDate,
      'items': items
          .map((item) => item.toJson())
          .toList(), // Convert list of CartItemModel to JSON
    };
  }

  ///      'orderDate': orderDate.toIso8601String(),
  // Create an OrderModel from a Firestore snapshot
  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => OrderStatus.processing,
      ),
      subTotal: json['subTotal'] as double,
      totalTax: json['totalTax'] ?? 0.0,
      deliveryFees: json['deliveryFees'] ?? 0.0,
      totalAmount: json['totalAmount'] as double,
      orderDate: (json['orderDate'] as Timestamp).toDate(),
      paymentMethod: json['paymentMethod'] as String,
      address: AddressModel.fromMap(json['address'] as Map<String, dynamic>),
      deliveryDate: json['deliveryDate'] != null
          ? (json['deliveryDate'] as Timestamp).toDate()
          : null,
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item
              as Map<String, dynamic>)) // Assuming CartItemModel has fromJson
          .toList(),
    );
  }
}
