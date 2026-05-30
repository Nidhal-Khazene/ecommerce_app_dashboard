import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/helper/show_true_snack_bar.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_product_information_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/cubits/update_product_cubit/update_product_cubit.dart';

class EditProductViewBlocBuilder extends StatelessWidget {
  const EditProductViewBlocBuilder({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, UpdateProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: Scaffold(
            body: Center(child: CustomLoadingIndicator()),
          ),
          opacity: 0,
          inAsyncCall: state is UpdateProductLoading,
          child: EditProductInformationViewBody(productEntity: productEntity),
        );
      },
      listener: (context, state) {
        if (state is UpdateProductSuccess) {
          showTrueSnackBar(context, message: "تمت عملية تحديث المنتج بنجاح");
          Navigator.pop(context);
        }
        if (state is UpdateProductFailure) {
          showFalseSnackBar(context, errorMessage: "فشل عملية تحديث المنتج");
          Navigator.pop(context);
        }
      },
    );
  }
}
