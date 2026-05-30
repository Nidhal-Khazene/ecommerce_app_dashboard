import 'package:ecommerce_app_dashboard/core/helper/get_dummy_order.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_empty_data_image.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_item_list_view.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/update_order_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubits/fetch_orders_cubit/fetch_orders_cubit.dart';

class OrdersItemListViewBlocBuilder extends StatefulWidget {
  const OrdersItemListViewBlocBuilder({super.key, required this.statusIndex});
  final int statusIndex;

  @override
  State<OrdersItemListViewBlocBuilder> createState() =>
      _OrdersItemListViewBlocBuilderState();
}

class _OrdersItemListViewBlocBuilderState
    extends State<OrdersItemListViewBlocBuilder> {
  @override
  void didUpdateWidget(covariant OrdersItemListViewBlocBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.statusIndex != widget.statusIndex) {
      _fetchOrders();
    }
  }

  void _fetchOrders() {
    var orderCubit = context.read<FetchOrdersCubit>();

    switch (widget.statusIndex) {
      case 0:
        orderCubit.fetchOrders();
        break;
      case 1:
        orderCubit.fetchPendingOrders();
        break;
      case 2:
        orderCubit.fetchAcceptedOrders();
        break;
      case 3:
        orderCubit.fetchCancelledOrders();
        break;
      case 4:
        orderCubit.fetchDeliveredOrders();
        break;
    }
  }

  @override
  void initState() {
    _fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return UpdateOrderBlocBuilder(
            child: OrdersItemListView(orders: state.orders),
          );
        } else if (state is FetchOrdersFailure) {
          return CustomErrorWidget(text: state.errorMessage);
        } else if (state is FetchOrdersEmpty) {
          return CustomEmptyDataImage();
        } else {
          return Skeletonizer(
            child: OrdersItemListView(
              orders: [getDummyOrder(), getDummyOrder()],
            ),
          );
        }
      },
    );
  }
}
