import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/helper/show_true_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/cubits/create_product_cubit/add_product_cubit.dart';
import 'add_new_product_view_body.dart';

class AddNewProductViewBlocBuilder extends StatelessWidget {
  const AddNewProductViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: Scaffold(
            body: Center(child: CustomLoadingIndicator()),
          ),
          opacity: 0,
          inAsyncCall: state is AddProductLoading,
          child: AddNewProductViewBody(),
        );
      },
      listener: (context, state) {
        if (state is AddProductSuccess) {
          showTrueSnackBar(context, message: "تمت عملية إضافة المنتج بنجاح");
          Navigator.pop(context);
        }
        if (state is AddProductFailure) {
          showFalseSnackBar(context, errorMessage: "فشل عملية إضافة المنتج");
          Navigator.pop(context);
        }
      },
    );
  }
}
