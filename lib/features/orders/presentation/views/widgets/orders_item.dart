import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/order_action_buttons.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/product_order_item.dart';
import 'package:flutter/material.dart';

import 'delete_order_bloc_consumer.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorsData.kBorderColor, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("المبلغ الاجمالي: ", style: AppStyles.bold16),
              SizedBox(width: 4),
              Text("دج${orderEntity.totalPrice}", style: AppStyles.semiBold13),
              Spacer(),
              DeleteOrderIconBlocConsumer(orderEntity: orderEntity),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                "رقم تعريف الزبون: ",
                style: AppStyles.semiBold13.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
              SizedBox(width: 4),
              Text(
                orderEntity.uID,
                style: AppStyles.semiBold13.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text("عنوان الشحن: ", style: AppStyles.bold16),
          SizedBox(height: 4),
          Text(
            orderEntity.shippingAddressEntity.addressToString(),
            style: AppStyles.semiBold13,
          ),
          SizedBox(height: 16),
          Text("طريقة الدفع: ", style: AppStyles.bold16),
          SizedBox(height: 4),
          Text(orderEntity.paymentMethod, style: AppStyles.semiBold13),
          SizedBox(height: 16),
          Text("المنتجات:", style: AppStyles.bold16),
          SizedBox(height: 16),
          Column(
            spacing: 8,
            children: List.generate(
              orderEntity.orderProducts.length,
              (index) => ProductOrderItem(
                orderProductsEntity: orderEntity.orderProducts[index],
                orderEntity: orderEntity,
              ),
            ),
          ),
          SizedBox(height: 16),
          OrderActionButtons(orderEntity: orderEntity),
        ],
      ),
    );
  }
}
