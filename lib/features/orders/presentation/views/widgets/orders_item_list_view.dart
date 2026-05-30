import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_item.dart';
import 'package:flutter/material.dart';

class OrdersItemListView extends StatelessWidget {
  const OrdersItemListView({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: OrdersItem(orderEntity: orders[index]),
      ),
    );
  }
}
