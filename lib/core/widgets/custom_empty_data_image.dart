import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';

class CustomEmptyDataImage extends StatelessWidget {
  const CustomEmptyDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.imagesHelperNoData,
        height: 200,
        width: 200,
      ),
    );
  }
}
