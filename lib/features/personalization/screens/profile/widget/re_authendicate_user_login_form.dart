import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';


class ReAuthLogin extends StatelessWidget {
  const ReAuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(

      appBar: AppBar(title: Text("Re-Authendication User"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(
                children: [
                  ///Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => TValidator.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.email),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  ///password
                  Obx(() => TextFormField(
                      controller: controller.verifyPassword,
                      validator: (value) => TValidator.validatePassword(value),
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye))),
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Sign-in button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.reAuthenticationEmailAndPassword();
                            // Get.to(()=>const NavigationMenu());
                          },
                          child: const Text("Verify"))),

                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
