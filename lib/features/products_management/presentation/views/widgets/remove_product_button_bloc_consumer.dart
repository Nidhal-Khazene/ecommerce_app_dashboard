import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/show_false_snack_bar.dart';
import '../../../../../core/helper/show_true_snack_bar.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/cubits/remove_product_cubit/remove_product_cubit.dart';
import 'edit_product_information_view_body.dart';

class RemoveProductButtonBlocConsumer extends StatelessWidget {
  const RemoveProductButtonBlocConsumer({super.key, required this.widget});

  final EditProductInformationViewBody widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveProductCubit, RemoveProductState>(
      builder: (context, state) {
        if (state is RemoveProductLoading) {
          return CustomButton(
            widget: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            borderColor: Colors.red,
            backgroundColor: Colors.red,
          );
        }
        return CustomButton(
          text: "حذف الصنف",
          onPressed: () {
            context.read<RemoveProductCubit>().removeProduct(
              productCode: widget.productEntity.productCode,
              imagePath: widget.productEntity.imagePath!,
            );
          },
          borderColor: Colors.red,
          backgroundColor: Colors.red,
          textStyle: AppStyles.bold13.copyWith(color: Colors.white),
        );
      },
      listener: (context, state) {
        if (state is RemoveProductSuccess) {
          Navigator.pop(context);
          showTrueSnackBar(context, message: "نجاح حذف المنتج");
        }
        if (state is RemoveProductFailure) {
          Navigator.pop(context);
          showFalseSnackBar(context, errorMessage: "نجاح حذف المنتج");
        }
      },
    );
  }
}
