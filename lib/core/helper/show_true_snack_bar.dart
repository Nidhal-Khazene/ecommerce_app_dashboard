import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../utils/app_styles.dart';
import '../utils/assets.dart';

void showTrueSnackBar(
  BuildContext context, {
  required String message,
  int? secondsDuration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.white,
      content: Row(
        children: [
          SvgPicture.asset(Assets.imagesHelperTrueCircleContainer),
          const SizedBox(width: 12),
          Text(
            message,
            style: AppStyles.regular13.copyWith(color: Colors.black),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: kHorizontalPadding,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: Duration(seconds: secondsDuration ?? 1),
    ),
  );
}
