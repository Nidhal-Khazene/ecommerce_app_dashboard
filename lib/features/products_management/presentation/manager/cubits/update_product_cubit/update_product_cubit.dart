import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/repos/images_repo.dart';
import '../../../../domain/repos/products_repo.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit({required this.imagesRepo, required this.productRepo})
    : super(UpdateProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productRepo;

  Future<void> updateProduct({
    required ProductEntity product,
    File? fileImage,
    String? imagePath,
  }) async {
    if (state is UpdateProductLoading) return;

    emit(UpdateProductLoading());

    try {
      // Step 1: Update Image (optional)
      if (fileImage != null && imagePath != null) {
        final imageResult = await imagesRepo.updateImage(
          fileImage: fileImage,
          imagePath: imagePath,
        );

        if (imageResult.isLeft()) {
          final failure = imageResult.swap().getOrElse(() => throw Exception());
          emit(UpdateProductFailure(errMessage: failure.message));
          return;
        }
      }

      // Step 2: Update Product
      final productResult = await productRepo.updateProduct(
        productEntity: product,
        productCode: product.productCode,
      );

      productResult.fold(
        (failure) => emit(UpdateProductFailure(errMessage: failure.message)),
        (_) => emit(UpdateProductSuccess()),
      );
    } catch (e) {
      emit(UpdateProductFailure(errMessage: e.toString()));
    }
  }
}
