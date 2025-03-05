import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widget/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/helpers/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddNewAddressScreen());
          },
          backgroundColor: TColors.primary,
          child: const Icon(
            Iconsax.add,
            color: TColors.white,
          ),
        ),
        appBar: TAppBar(
          title: Text(
            'Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddresses(),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot);
                    if (widget != null) return widget;
                    final addresses = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (_, index) {
                          return TSingleAddress(
                            address: addresses[index],
                            onTap: () =>
                                controller.selectAddress(addresses[index]),
                          );
                        });
                  }),
            ),
          ),
        ));
  }
}
