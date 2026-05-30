import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message, style: AppStyles.bold16)));
}
