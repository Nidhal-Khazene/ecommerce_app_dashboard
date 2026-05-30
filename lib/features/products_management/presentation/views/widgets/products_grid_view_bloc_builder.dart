import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_dummy_products.dart';
import '../../../../../core/widgets/custom_empty_data_image.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubits/get_products_cubit/products_cubit.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsEmpty) {
          return SliverToBoxAdapter(child: CustomEmptyDataImage());
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
