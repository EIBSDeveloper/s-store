import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controller/signup/signup_controller.dart';



class TTermsAndConditionCheckBox extends StatelessWidget {
  const TTermsAndConditionCheckBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller =  SignupController.instance;

    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24,height: 24,
          child: Obx(
            ()=> Checkbox(value: controller.privacyPolicyCheck.value, onChanged: (value){
              controller.privacyPolicyCheck.value= !controller.privacyPolicyCheck.value;
            }),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
              TextSpan(children: [
                TextSpan(text: '${TTexts.iAgreeTo} ',style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '${TTexts.privacyPolicy} ',style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark? TColors.white:TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary
                )),
                TextSpan(text: '${TTexts.and } ',style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: TTexts.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark? TColors.white:TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary
                )),
              ])),
        )
      ],
    );
  }
}
