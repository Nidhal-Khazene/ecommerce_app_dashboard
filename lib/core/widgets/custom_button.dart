import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/colors_data.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadiusValue,
    this.textStyle,
    this.borderColor,
    this.widget,
  });

  final void Function()? onPressed;
  final String? text;
  final Color? backgroundColor;
  final double? width, height;
  final double? borderRadiusValue;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsData.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue ?? 16),
            side: BorderSide(
              width: 1,
              color: borderColor ?? Colors.transparent,
            ),
          ),
        ),
        onPressed: onPressed,
        child:
            widget ??
            Center(
              child: Text(
                text ?? "",
                style:
                    textStyle ?? AppStyles.bold16.copyWith(color: Colors.white),
              ),
            ),
      ),
    );
  }
}
