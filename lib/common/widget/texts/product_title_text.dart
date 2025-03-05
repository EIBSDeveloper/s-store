import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallsize = false,
    this.maxline=2,
    this.textAlign=TextAlign.left,
  });

  final String title;
  final bool smallsize;
  final int maxline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
        style: smallsize? Theme.of(context).textTheme.labelLarge: Theme.of(context).textTheme.titleMedium,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
