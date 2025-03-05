import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/primary_header_container.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/screen/cart/cart.dart';
import 'package:t_store/features/shop/screen/orders/order.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/list_tile/setting_menu_tile.dart';
import '../../../../common/widget/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/snackbars/loaders.dart';
import '../../../authendication/screens/login/login.dart';
import '../address/address.dart';
import '../profile/profile.dart';
import '../upload/upload.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeadersContainer(
                child: Column(
              children: [
                ///AppBar
                TAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.apply(color: TColors.white)),
                ),

                TUserProfileTile(
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///=========Account Settings ============== ///
                  const TSectionHeading(
                    title: 'Account Settings',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shipping delivery address',
                    ontap: () {
                      Get.to(() => UserAddressScreen());
                    },
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add remove product and move to checkout',
                    ontap: () => Get.to(() => CartScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In progress and completed orders',
                    ontap: () => Get.to(() => OrderScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    ontap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                    ontap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subtitle: 'Set any kind of notification message',
                    ontap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected account',
                    ontap: () {},
                  ),

                  ///=========App Settings ============== ///
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showactionbutton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload Data to you Cloud Firebase',
                    ontap: () => Get.to(() => const UploadProducts()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    ontap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    ontap: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'SET image quality to be seen',
                    ontap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ),

                  ///Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Confirm Logout",
                              titleStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              middleText: 'Are you sure you want to log out?',
                              middleTextStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              barrierDismissible: false,
                              radius: 8,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              textConfirm: "LogOut",
                              textCancel: "Cancel",
                              confirmTextColor: Colors.white,
                              cancelTextColor: TColors.primary,
                              buttonColor: TColors.primary,
                              onConfirm: () {
                                FirebaseAuth.instance.signOut();
                                Get.offAll(() => const LoginScreen());
                                TLoaders.customToast(
                                    message: 'Logout successfully');
                              },
                              onCancel: () {},
                            );
                          },
                          child: const Text('Logout'))),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
