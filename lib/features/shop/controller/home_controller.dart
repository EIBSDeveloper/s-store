import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  /// Variable
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;

  /// update the Navigate Dots
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }


}
