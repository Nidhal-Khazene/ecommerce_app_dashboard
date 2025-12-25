import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CustomButton(onPressed: () {}, text: "Add Data")],
    );
  }
}
