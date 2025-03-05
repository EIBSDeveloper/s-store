import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/custome _shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class TSingleAddress extends StatelessWidget {
  const   TSingleAddress({super.key, required this.address, required this.onTap});

  final VoidCallback onTap;
final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedaddress =selectedAddressId == address.id;
       return InkWell(
          onTap:onTap,
          child: TRoundedContainer(
            width: double.infinity,
            padding: EdgeInsets.all(TSizes.md),
            showborder: true,
            backgroundColor: selectedaddress
                ? TColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedaddress
                ? Colors.transparent
                : dark
                ? TColors.darkerGrey
                : TColors.grey,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(
                      selectedaddress ? Iconsax.tick_circle5 : null,
                      color: selectedaddress
                          ? dark
                          ? TColors.light
                          : TColors.dark.withOpacity(0.7)
                          : null,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: TSizes.sm/2,),

                    Text(
                      address.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: TSizes.sm/2,),

                    Text(
                      address.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
        }
    );
  }
}
