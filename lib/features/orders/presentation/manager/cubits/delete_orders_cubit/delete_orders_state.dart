part of 'delete_orders_cubit.dart';

@immutable
sealed class DeleteOrdersState {}

final class DeleteOrdersInitial extends DeleteOrdersState {}

final class DeleteOrdersLoading extends DeleteOrdersState {}

final class DeleteOrdersSuccess extends DeleteOrdersState {}

final class DeleteOrdersFailure extends DeleteOrdersState {
  final String errorMessage;

  DeleteOrdersFailure({required this.errorMessage});
}
