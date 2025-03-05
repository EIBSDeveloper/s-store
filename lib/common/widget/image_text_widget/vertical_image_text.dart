import 'package:flutter/material.dart';
import 'package:t_store/common/widget/images/t_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    this.textcolor = TColors.textWhite,
    this.backgroundColor,
    this.onTap,
    required this.title, this.isNetworkImage = true,
  });

  final Color textcolor;
  final String image;
  final Color? backgroundColor;
  final String title;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
            children: [

              TCircularImage(image: image,
                isNetworkImage: isNetworkImage,
                fit: BoxFit.fitWidth,
                padding: TSizes.sm * 1.4,
                backgroundColor: backgroundColor,
                overlayColor: THelperFunctions.isDarkMode(context) ? TColors
                    .light : TColors.dark,),
              // Container(
              //   width: 50,
              //   height: 50,
              //
              //   padding: const EdgeInsets.all(TSizes.sm),
              //   decoration: BoxDecoration(
              //     color: dark? TColors.black : TColors.white,
              //     borderRadius: BorderRadius.circular(100),
              //   ),
              //   child: Center(
              //     child: Image(image: AssetImage(image),fit: BoxFit.cover,color:dark? TColors.light:TColors.dark,),
              //   ),
              // ),
              ///---------Circle Text---------------///
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              SizedBox(
                width: 55,
                child: Center(
                  child: Text(
                    title, style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textcolor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
