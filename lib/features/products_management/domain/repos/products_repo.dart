import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, Unit>> addProduct(ProductEntity addProductInputEntity);

  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Stream<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, void>> updateProduct({
    required ProductEntity productEntity,
    required String productCode,
  });
  Future<Either<Failure, void>> deleteProduct({required String productCode});
}
