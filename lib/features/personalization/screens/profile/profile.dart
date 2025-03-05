import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/images/t_circular_image.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/personalization/screens/profile/widget/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widget/profile_menu.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/loaders/shimmers/shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final userDetails = controller.user.value;
    return  Scaffold(
      appBar: const TAppBar(title: Text("Profile"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty?networkImage:TImages.user;

                      return controller.imageUploading.value?const TShimmerEffect(width: 50, height: 50,radius: 50,):TCircularImage(image:image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty,);
                    } ),
                    TextButton(onPressed:()=>controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),

                  ],
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(width: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Profile Information',showactionbutton: false,),
              const SizedBox(width: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: userDetails.fullname,onPressed: (){Get.to(()=>const ChangeName());},),
              TProfileMenu(title: 'Username', value: userDetails.userName,onPressed: (){},),

              const SizedBox(width: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(width: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Personal Information',showactionbutton: false,),
              const SizedBox(width: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: userDetails.id,icon:Iconsax.copy,onPressed: (){},),
              TProfileMenu(title: 'Email', value:userDetails.email,onPressed: (){},),
              TProfileMenu(title: 'Phone Number', value:userDetails.phoneNumber,onPressed: (){},),
              TProfileMenu(title: 'Gender', value: 'Male',onPressed: (){},),
              TProfileMenu(title: 'Date Of Birth', value: '06-Mar-1998',onPressed: (){},),
              const Divider(),
              const SizedBox(width: TSizes.spaceBtwItems),

              TextButton(onPressed: (){controller.deleteAccountWarningPop();}, child: const Text('Close Account',style: TextStyle(color: Colors.red),))

            ],
          ),
        ),

      )
    );
  }
}
