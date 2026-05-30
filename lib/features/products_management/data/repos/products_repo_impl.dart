import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/utils/backend_break_point.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/products_repo.dart';
import '../models/product_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, Unit>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendBreakPoint.productCollections,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
        documentId: addProductInputEntity.productCode,
      );
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: "فشل اضافة المنتج"));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getProducts,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      )) {
        List<ProductEntity> products = (data as List<dynamic>)
            .map<ProductEntity>((e) => ProductModel.fromJson(e).toEntity())
            .toList();
        yield right(products);
      }
    } catch (e) {
      yield left(ServerFailure(message: "Failed to get product!"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendBreakPoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: "فشل الحصول على المنتجات"));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct({
    required ProductEntity productEntity,
    required String productCode,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendBreakPoint.updateProducts,
        data: ProductModel.fromEntity(productEntity).toJson(),
        documentId: productCode,
      );
      return Right(null);
    } on Exception {
      return Left(ServerFailure(message: "حدث خطأ في عملية تحديث المنتج"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct({
    required String productCode,
  }) async {
    try {
      await databaseService.deleteData(
        path: BackendBreakPoint.deleteProducts,
        documentId: productCode,
      );
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: "فشل حذف المنتج!"));
    }
  }
}
