import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_data.dart';

class OrdersLine extends StatelessWidget {
  const OrdersLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: ColorsData.kLightPrimaryColor),
        ),
      ),
    );
  }
}
