import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, Unit>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
