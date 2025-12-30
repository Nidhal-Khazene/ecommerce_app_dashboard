import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.fileImage);
    result.fold(
      (failure) => emit(AddProductFailure(errMessage: failure.message)),
      (url) async {
        addProductInputEntity.urlImage = url;
        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) => AddProductFailure(errMessage: failure.message),
          (_) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
