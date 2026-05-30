import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/helper/show_false_snack_bar.dart';
import '../../../../../core/helper/show_true_snack_bar.dart';
import '../../../../../core/utils/colors_data.dart';
import '../../manager/cubits/remove_product_cubit/remove_product_cubit.dart';
import 'fruit_item.dart';

class RemoveProductIconBlocConsumer extends StatelessWidget {
  const RemoveProductIconBlocConsumer({super.key, required this.widget});

  final FruitItem widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveProductCubit, RemoveProductState>(
      builder: (context, state) {
        if (state is RemoveProductLoading) {
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
            context.read<RemoveProductCubit>().removeProduct(
              productCode: widget.productEntity.productCode,
              imagePath: widget.productEntity.imagePath!,
            );
          },
          icon: const Icon(Iconsax.trash, color: Colors.redAccent, size: 24),
        );
      },
      listener: (context, state) {
        if (state is RemoveProductSuccess) {
          showTrueSnackBar(
            context,
            message: "نجاح حذف المنتج",
            secondsDuration: 2,
          );
        }
        if (state is RemoveProductFailure) {
          showFalseSnackBar(
            context,
            errorMessage: "فشل حذف المنتج",
            secondsDuration: 2,
          );
        }
      },
    );
  }
}
