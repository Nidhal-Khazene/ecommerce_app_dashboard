import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/helper/show_true_snack_bar.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/update_orders_cubit/cubit/update_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpdateOrderBlocBuilder extends StatelessWidget {
  const UpdateOrderBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderFailure) {
          showFalseSnackBar(context, errorMessage: state.errMessage);
        }
        if (state is UpdateOrderSuccess) {
          showTrueSnackBar(context, message: "نجاح تحديث حالة الطلب");
        }
      },
      builder: (context, state) {
        return Skeletonizer(enabled: state is UpdateOrderLoading, child: child);
      },
    );
  }
}
