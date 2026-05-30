import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/delete_orders_cubit/delete_orders_cubit.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/update_orders_cubit/cubit/update_order_cubit.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        textColor: Colors.white,
        title: "الطلبات",
        backgroundColor: ColorsData.kLightPrimaryColor,
        context: context,
      ),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FetchOrdersCubit(ordersRepo: getIt<OrdersRepo>()),
              ),
              BlocProvider(
                create: (context) =>
                    UpdateOrderCubit(ordersRepo: getIt<OrdersRepo>()),
              ),
              BlocProvider(
                create: (context) =>
                    DeleteOrdersCubit(ordersRepo: getIt<OrdersRepo>()),
              ),
            ],
            child: OrdersViewBody(),
          ),
        ),
      ),
    );
  }
}
