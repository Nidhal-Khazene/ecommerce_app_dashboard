import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/delete_orders_cubit/delete_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/helper/show_false_snack_bar.dart';
import '../../../../../core/helper/show_true_snack_bar.dart';
import '../../../../../core/utils/colors_data.dart';
import '../../../domain/entities/order_entity.dart';

class DeleteOrderIconBlocConsumer extends StatelessWidget {
  const DeleteOrderIconBlocConsumer({super.key, required this.orderEntity});
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteOrdersCubit, DeleteOrdersState>(
      builder: (context, state) {
        if (state is DeleteOrdersLoading) {
          return Container(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: ColorsData.kLightPrimaryColor,
                strokeWidth: 2,
              ),
            ),
          );
        }
        return IconButton(
          onPressed: () {
            context.read<DeleteOrdersCubit>().deleteOrder(
              orderID: orderEntity.orderID,
            );
          },
          icon: const Icon(Iconsax.trash, color: Colors.redAccent, size: 24),
        );
      },
      listener: (context, state) {
        if (state is DeleteOrdersSuccess) {
          showTrueSnackBar(
            context,
            message: "نجاح حذف الطلب",
            secondsDuration: 2,
          );
        }
        if (state is DeleteOrdersFailure) {
          showFalseSnackBar(
            context,
            errorMessage: state.errorMessage,
            secondsDuration: 2,
          );
        }
      },
    );
  }
}
