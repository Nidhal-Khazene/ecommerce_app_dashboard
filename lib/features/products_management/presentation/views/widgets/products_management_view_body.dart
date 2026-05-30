import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/get_products_cubit/products_cubit.dart';

class ProductsManagementViewBody extends StatefulWidget {
  const ProductsManagementViewBody({super.key});

  @override
  State<ProductsManagementViewBody> createState() =>
      _ProductsManagementViewBodyState();
}

class _ProductsManagementViewBodyState
    extends State<ProductsManagementViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [ProductsGridViewBlocBuilder()]);
  }
}
