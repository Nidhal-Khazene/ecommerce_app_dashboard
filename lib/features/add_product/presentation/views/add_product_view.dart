import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = "AddProductView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Add Product"),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: BlocProvider(
            create: (context) => AddProductCubit(
              imagesRepo: getIt<ImagesRepo>(),
              productRepo: getIt<ProductRepo>(),
            ),
            child: AddProductViewBody(),
          ),
        ),
      ),
    );
  }
}
