part of 'fetch_orders_cubit.dart';

@immutable
sealed class FetchOrdersState {}

final class FetchOrdersInitial extends FetchOrdersState {}

final class FetchOrdersLoading extends FetchOrdersState {}

final class FetchOrdersEmpty extends FetchOrdersState {}

final class FetchOrdersFailure extends FetchOrdersState {
  final String errorMessage;

  FetchOrdersFailure({required this.errorMessage});
}

final class FetchOrdersSuccess extends FetchOrdersState {
  final List<OrderEntity> orders;

  FetchOrdersSuccess({required this.orders});
}
