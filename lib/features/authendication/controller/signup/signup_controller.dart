import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authendication/authendication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authendication/screens/signup/verify_email.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/full_screen_loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/snackbars/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicyCheck = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      ///Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      ///privacy policy check
      if (!privacyPolicyCheck.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use');
        return;
      }

      ///start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.dockerAnimation);

      ///Register user in the firebase
      final userCredential = await AuthendicationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///Save authendication data in firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNo.text.trim(),
          userName: username.text.trim(),
          email: email.text.trim(),
          profilePicture: '',
          password: password.text.trim());

      final userRepository = Get.put(UserRepoisitory());
      userRepository.saveUserRecord(newUser);
      TFullScreenLoader.stopLoading();

      ///Show Success Message
      TLoaders.successSnackBar(
          title: "Congratulation",
          message: 'Your Account has been created! Verify email to continue');

      ///Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: "oh Snap", message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
