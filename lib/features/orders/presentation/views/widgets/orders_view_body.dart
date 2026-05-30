import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_item_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  int statusIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        FilterSection(
          statusChanged: (value) {
            setState(() {
              statusIndex = value;
            });
          },
        ),
        SizedBox(height: 24),
        Expanded(
          child: OrdersItemListViewBlocBuilder(statusIndex: statusIndex),
        ),
      ],
    );
  }
}
