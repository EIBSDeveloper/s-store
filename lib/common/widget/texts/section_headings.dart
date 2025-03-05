import 'package:flutter/material.dart';


class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textcolor,
    this.buttontitle = 'View all',
    required this.title,
    this.showactionbutton = true,
    this.onpressed,
  });
  final Color? textcolor;
  final String buttontitle,title;
  final bool showactionbutton;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.apply(color: textcolor),maxLines: 1,overflow: TextOverflow.ellipsis),
        if(showactionbutton) TextButton(onPressed:onpressed , child: Text(buttontitle))
        // else Center()
      ],
    );
  }
}
