

import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controller/product/variation_controller.dart';
import 'package:t_store/utils/network/network_manager.dart';

import '../features/shop/controller/product/checkout_controller.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }

}