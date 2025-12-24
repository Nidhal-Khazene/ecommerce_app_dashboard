import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    default:
      return MaterialPageRoute(builder: (context) => const DashboardView());
  }
}
