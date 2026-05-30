import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Stream<Either<Failure, List<OrderEntity>>> fetchPendingOrders();
  Stream<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders();
  Stream<Either<Failure, List<OrderEntity>>> fetchCancelledOrders();
  Stream<Either<Failure, List<OrderEntity>>> fetchDeliveredOrders();

  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  });
  Future<Either<Failure, void>> deleteOrder({required String orderID});
}
