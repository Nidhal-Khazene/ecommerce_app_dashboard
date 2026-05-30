import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/dashboard_item.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/widgets/log_out_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../orders/presentation/views/orders_view.dart';
import '../../../../products_management/presentation/views/products_management_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: kPrimaryScreenPadding,
            child: Column(
              children: [
                SizedBox(height: 74),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductsManagementView.routeName,
                    );
                  },
                  child: DashboardItem(
                    textContent: "ادارة  الاصناف والمنتجات ",
                    iconImage: Assets.imagesDashboardOpenCardboardBox,
                    iconImagePadding: 10,
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrdersView.routeName);
                  },
                  child: DashboardItem(
                    textContent: "خدمة العملاء والطلبات ",
                    iconImage: Assets.imagesDashboardChecked,
                    iconImagePadding: 18,
                  ),
                ),
                SizedBox(height: 24),
                DashboardItem(
                  textContent: "ادارة الشحن والتفريغ ",
                  iconImage: Assets.imagesDashboardShippingCar,
                  iconImagePadding: 8,
                ),
                SizedBox(height: 24),
                DashboardItem(
                  textContent: "ادراة المخازن والمنتجات ",
                  iconImage: Assets.imagesDashboardShippingChart,
                  iconImagePadding: 16,
                ),
              ],
            ),
          ),
          SizedBox(height: 128),
          LogOutButton(),
        ],
      ),
    );
  }
}
