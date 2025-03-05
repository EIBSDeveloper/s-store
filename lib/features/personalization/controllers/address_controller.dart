import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/widget/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

import '../../../common/widget/texts/section_headings.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loaders.dart';
import '../../../utils/snackbars/loaders.dart';
import '../screens/address/add_new_address.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  RxBool refreshData = true.obs;
  RxBool isLoading = true.obs;
  final addressRepository = Get.put(AddressRepository());

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController(text: "India");
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressList = <AddressModel>[].obs;

  /// Add new Address

  void addNewAddress() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.dockerAnimation);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form Validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// save Address
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      /// Update Address status
      address.id = id;
      await selectAddress(address);

      TFullScreenLoader.stopLoading();

      /// show sucess message
      TLoaders.successSnackBar(
          title: 'Congratulation 😊',
          message: 'Your Address has been saved successfully.');

      /// refresh data
      refreshData.toggle();

      /// reset form feild
      resetFormFields();

      /// redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TLoaders.errorSnackBar(title: "oh Snap", message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }

  /// fetch all user specific address
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      isLoading.value = true;

      final addresses = await addressRepository.fetchUserAddress();

      addressList.value = addresses;
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Address not found", message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator(
            color: TColors.primary,
            strokeWidth: 6,
          ));

      /// clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updatedSelectedField(
            newSelectedAddress.id, false);
      }

      /// Assign the selected Address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      /// set the selected address is true
      await addressRepository.updatedSelectedField(newSelectedAddress.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(message: e.toString());
      Get.back();
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(
                  title: 'Select Address', showactionbutton: false),
              FutureBuilder(
                  future: getAllUserAddresses(),
                  builder: (_, snapshot) {
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot);

                    if (response != null) return response;

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          return TSingleAddress(
                              address: snapshot.data![index],
                              onTap: () async {
                                await selectAddress(snapshot.data![index]);
                                Get.back();
                              });
                        });
                  }),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()),
                    child: const Text('Add new address')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
