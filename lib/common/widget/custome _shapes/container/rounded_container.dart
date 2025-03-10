import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {
      super.key,
      this.width,
      this.height,
      this.radius=TSizes.cardRadiusLg,
      this.child,
      this.showborder=false,
      this.borderColor=TColors.borderPrimary,
      this.backgroundColor=TColors.white,
      this.padding,
      this.margin
      });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showborder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showborder? Border.all(color: borderColor):null
      ),
      child: child,
    );
  }
}
