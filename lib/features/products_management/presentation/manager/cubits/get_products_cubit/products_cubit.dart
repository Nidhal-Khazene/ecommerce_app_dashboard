import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/repos/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  StreamSubscription? _streamSubscription;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  void getBestSellingProducts() {
    emit(ProductsLoading());
    _streamSubscription = productsRepo.getBestSellingProducts().listen((
      result,
    ) {
      result.fold(
        (failure) => emit(ProductsFailure(errMessage: failure.message)),
        (products) {
          if (products.isEmpty) {
            emit(ProductsEmpty());
          } else {
            emit(ProductsSuccess(products: products));
          }
        },
      );
    });
  }
}
