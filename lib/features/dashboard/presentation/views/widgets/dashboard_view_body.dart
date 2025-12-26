import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductView.routeName);
          },
          text: "add product",
          backgroundColor: ColorsData.kLightPrimaryColor,
          textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
