import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/model/banner_model.dart';

import '../../../utils/snackbars/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
// Show loader while loading banners
      isLoading.value = true;

      /// Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banner = await bannerRepo.fetchBanners();

      banners.assignAll(banner);
      print('Image Url : ${banners.first.imageUrl}');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
//Remove Loader
      isLoading.value = false;
    }
  }
}
