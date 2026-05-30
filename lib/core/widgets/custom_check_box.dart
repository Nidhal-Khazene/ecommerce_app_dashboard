import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? ColorsData.kLightPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1.50,
              color: !isChecked ? const Color(0xFFDCDEDE) : Colors.transparent,
            ),
          ),
        ),
        child: isChecked
            ? Icon(Icons.check, color: Colors.white)
            : const SizedBox(),
      ),
    );
  }
}
