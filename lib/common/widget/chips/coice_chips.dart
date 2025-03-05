import 'package:flutter/material.dart';
import 'package:t_store/common/widget/custome%20_shapes/container/circular_container.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor?const SizedBox(): Text(text),
        selected: selected,
        onSelected:onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor? TCircularCointainer(width: 50,height: 50,backgroundColor:THelperFunctions.getColor(text)!,):null,
        shape: isColor? CircleBorder():null,
        labelPadding:   isColor?EdgeInsets.all(0):null,
        padding:        isColor? EdgeInsets.all(0):null,
        // selectedColor:  isColor? Colors.green:null,
        backgroundColor:isColor?  Colors.green:null,
      ),
    );
  }
}
