import 'package:flutter/material.dart';
import 'package:t_store/common/widget/loaders/shimmers/shimmer.dart';

import '../../layouts/grid_layout.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, __) {
        return const TShimmerEffect(width: 300, height: 80);
      },
    );
  }
}
