import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/core/services/database_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/backend_break_point.dart';
import 'package:ecommerce_app_dashboard/features/add_product/data/models/product_model.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, Unit>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendBreakPoint.productCollections,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to add product"));
    }
  }
}
