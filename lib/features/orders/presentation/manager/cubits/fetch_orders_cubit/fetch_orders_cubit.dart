import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/order_entity.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit({required this.ordersRepo}) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;
  StreamSubscription? _streamSubscription;

  void fetchOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
        (orders) {
          if (orders.isEmpty) {
            emit(FetchOrdersEmpty());
          } else {
            emit(FetchOrdersSuccess(orders: orders));
          }
        },
      );
    });
  }

  void fetchPendingOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchPendingOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
        (orders) {
          if (orders.isEmpty) {
            emit(FetchOrdersEmpty());
          } else {
            emit(FetchOrdersSuccess(orders: orders));
          }
        },
      );
    });
  }

  void fetchAcceptedOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchAcceptedOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
        (orders) {
          if (orders.isEmpty) {
            emit(FetchOrdersEmpty());
          } else {
            emit(FetchOrdersSuccess(orders: orders));
          }
        },
      );
    });
  }

  void fetchCancelledOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchCancelledOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
        (orders) {
          if (orders.isEmpty) {
            emit(FetchOrdersEmpty());
          } else {
            emit(FetchOrdersSuccess(orders: orders));
          }
        },
      );
    });
  }

  void fetchDeliveredOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchDeliveredOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
        (orders) {
          if (orders.isEmpty) {
            emit(FetchOrdersEmpty());
          } else {
            emit(FetchOrdersSuccess(orders: orders));
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
