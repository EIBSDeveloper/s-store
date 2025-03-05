import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authendication/screens/signup/widget/signup_form.dart';

import '../../../../common/widget/login_signup/form_divder.dart';
import '../../../../common/widget/login_signup/social_media.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header Tittle

            Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),
          ///Form
             const TSignUp_Form(),
            const SizedBox(height: TSizes.spaceBtwSections,),
            ///Divider
            TFormDivder(divdertext: TTexts.orSignUpWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections,),

            ///Social Button
            const TSocialMedia()

          ],
        ),),
      )

    );
  }
}
