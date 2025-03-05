import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authendication/authendication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authendication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/profile/widget/re_authendicate_user_login_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/full_screen_loaders.dart';
import 'package:t_store/utils/snackbars/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoader = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRespository = Get.put(UserRepoisitory());

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  /// Fetch User Records
  Future<void> fetchUserRecords() async {
    try {
      profileLoader.value = true;
      final user = await userRespository.fetchUserDetails();
      this.user(user);
      profileLoader.value = false;
    } catch (e) {
      user(UserModel.empty());
      profileLoader.value = false;
    } finally {
      profileLoader.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecords();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // final nameparts = UserModel.generateUsername(fullname);
          // final nameparts = UserModel.nameParts(userCredential.user!.displayName??"");
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? "");
        }
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  ///D-- Delete Account Warning
  void deleteAccountWarningPop() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(TSizes.md),
        title:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Cancel'),
            )));
  }

  ///  --- Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing", TImages.dockerAnimation);

      final auth = AuthendicationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLogin());
        }
        await auth.deleteAccount();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Email and password signIn
  Future<void> reAuthenticationEmailAndPassword() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.dockerAnimation);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Login user using email and password
      AuthendicationRepository.instance.reAuthendicationWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());

      AuthendicationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  ///--- Upload User Profile Picture

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        /// Upload Image
        final imageUrl =
            await userRespository.uploadImage('Users/Images/Profile', image);

        ///Update Your Image Records
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRespository.updateSingleFields(json);
        TLoaders.successSnackBar(
            title: "Congratulation",
            message: "Your profile Image has been Updated!");

        user.value.profilePicture = imageUrl;
        user.refresh();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
