import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../utils/app_styles.dart';
import '../utils/assets.dart';

void showFalseSnackBar(
  BuildContext context, {
  required String errorMessage,
  int? secondsDuration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.white,
      content: Row(
        children: [
          SvgPicture.asset(Assets.imagesHelperFalseIcon, height: 20, width: 20),
          const SizedBox(width: 12),
          Text(
            errorMessage,
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
