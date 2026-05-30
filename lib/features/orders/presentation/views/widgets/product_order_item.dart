import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_image_network.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/product_order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/order_status_button.dart';
import 'package:flutter/material.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({
    super.key,
    required this.orderProductsEntity,
    required this.orderEntity,
  });

  final OrderProductsEntity orderProductsEntity;
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: 80,
            height: 120,
            child: CustomImageNetwork(urlImage: orderProductsEntity.imageUrl),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderProductsEntity.productName,
                    style: AppStyles.bold19,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${orderProductsEntity.productPrice} دينار',
                    textAlign: TextAlign.right,
                    style: AppStyles.bold19.copyWith(
                      color: ColorsData.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${orderEntity.date} ', style: AppStyles.regular13),
                  Text(
                    '${orderProductsEntity.quantity} عناصر',
                    style: AppStyles.regular13.copyWith(
                      color: ColorsData.kSecondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [OrderStatusButton(orderEntity: orderEntity)],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
