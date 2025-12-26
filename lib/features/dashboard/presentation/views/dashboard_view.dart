import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/build_app_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = "DashboardView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "FruitHub Dashboard"),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: DashboardViewBody(),
        ),
      ),
    );
  }
}
