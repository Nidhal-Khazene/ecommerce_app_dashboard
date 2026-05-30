import 'package:ecommerce_app_dashboard/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/orders_view.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_new_product_view.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_product_information_view.dart';
import 'package:flutter/material.dart';

import '../../features/products_management/domain/entities/product_entity.dart';
import '../../features/products_management/presentation/views/products_management_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case ProductsManagementView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductsManagementView(),
      );
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    case AddNewProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddNewProductView());
    case EditProductInformationView.routeName:
      final product = settings.arguments as ProductEntity;

      return MaterialPageRoute(
        builder: (context) =>
            EditProductInformationView(productEntity: product),
      );
    default:
      return MaterialPageRoute(builder: (context) => const DashboardView());
  }
}
