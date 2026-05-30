import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/repos/images_repo.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'remove_product_state.dart';

class RemoveProductCubit extends Cubit<RemoveProductState> {
  RemoveProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(RemoveProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> removeProduct({
    required String productCode,
    required String imagePath,
  }) async {
    emit(RemoveProductLoading());
    final imageResult = await imagesRepo.deleteImage(imagePath);
    imageResult.fold(
      (failure) => emit(RemoveProductFailure(errMessage: failure.message)),
      (_) async {
        final productResult = await productsRepo.deleteProduct(
          productCode: productCode,
        );
        productResult.fold(
          (failure) => emit(RemoveProductFailure(errMessage: failure.message)),
          (_) => emit(RemoveProductSuccess()),
        );
      },
    );
  }
}
