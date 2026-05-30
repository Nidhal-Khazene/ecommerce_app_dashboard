import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/core/services/database_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/backend_break_point.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/order_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getOrders,
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: "فشل تحميل على الطلبات!"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendBreakPoint.updateOrders,
        data: {"status": status.name},
        documentId: orderID,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: "حدث مشكل في تحديث حالة الطلب!"));
    }
  }

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getOrders,
        query: {'where': 'status', 'isEqualTo': 'accepted'},
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: "فشل تحميل الطلبات المقبولة!"));
    }
  }

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchCancelledOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getOrders,
        query: {'where': 'status', 'isEqualTo': 'cancelled'},
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: "فشل تحميل الطلبات المرفوضة!"));
    }
  }

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchDeliveredOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getOrders,
        query: {'where': 'status', 'isEqualTo': 'delivered'},
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: "فشل تحميل الطلبات المنجزة!"));
    }
  }

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchPendingOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendBreakPoint.getOrders,
        query: {'where': 'status', 'isEqualTo': 'pending'},
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: "فشل تحميل الطلبات جارية المعالجة!"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrder({required String orderID}) async {
    try {
      await databaseService.deleteData(
        path: BackendBreakPoint.deleteOrders,
        documentId: orderID,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: "فشل حذف الطلب"));
    }
  }
}
