import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 110,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: ColorsData.kLightPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Center(
        child: Text(
          'الغي الطلب',
          textAlign: TextAlign.center,
          style: AppStyles.semiBold11.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
