import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';


class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        title: Text("Change Name",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text("Use real name for easy verification. This name will appear on several pages.",
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updateUsernameFormKey,
                child: Column(
                  children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value)=>TValidator.validateEmptyField('First Name',value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                      ),
                    SizedBox(height: TSizes.spaceBtwInputFields,),
                    TextFormField(
                        controller: controller.lastName,
                        validator: (value)=>TValidator.validateEmptyField('First Name',value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                      ),
            ],)),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.updateUserName();
                    },
                    child: const Text("Save"))),



          ],
        ),
      ),
    );
  }
}
