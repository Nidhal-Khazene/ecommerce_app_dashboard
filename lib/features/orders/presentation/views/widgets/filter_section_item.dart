import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class FilterSectionItem extends StatelessWidget {
  const FilterSectionItem({
    super.key,
    required this.textContent,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    this.textStyle,
    this.width,
    this.height,
  });

  final String textContent;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
      width: width ?? 80,
      height: height ?? 32,
      padding: const EdgeInsets.only(top: 2, left: 12, right: 12, bottom: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(38),
        ),
      ),
      child: Center(
        child: Text(
          textContent,
          style: textStyle ?? AppStyles.semiBold13.copyWith(color: textColor),
        ),
      ),
    );
  }
}
