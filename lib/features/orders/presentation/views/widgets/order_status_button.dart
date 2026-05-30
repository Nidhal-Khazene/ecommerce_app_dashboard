import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section_item.dart';
import 'package:flutter/material.dart';

class OrderStatusButton extends StatelessWidget {
  const OrderStatusButton({Key? key, required this.orderEntity})
    : super(key: key);
  final OrderEntity orderEntity;

  Color _statusTextColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return ColorsData.kSecondaryColor;
      case OrderStatusEnum.accepted:
        return ColorsData.kPrimaryColor;
      case OrderStatusEnum.cancelled:
        return Colors.red;
      case OrderStatusEnum.delivered:
        return ColorsData.kFontSecondaryColor;
    }
  }

  Color _statusBackgroundColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return ColorsData.kLightSecondaryColor.withOpacity(0.35);
      case OrderStatusEnum.accepted:
        return ColorsData.kLightPrimaryColor.withOpacity(0.35);
      case OrderStatusEnum.cancelled:
        return Colors.red.withOpacity(0.12);
      case OrderStatusEnum.delivered:
        return ColorsData.kBorderColor.withOpacity(0.35);
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = orderEntity.status;
    final textColor = _statusTextColor(status);
    final backgroundColor = _statusBackgroundColor(status);

    return FilterSectionItem(
      textContent: "${status.name}",
      textColor: textColor,
      backgroundColor: backgroundColor,
      borderColor: textColor,
      height: 26,
      width: 100,
      textStyle: AppStyles.semiBold11.copyWith(color: textColor),
    );
  }
}
