part of 'remove_product_cubit.dart';

@immutable
sealed class RemoveProductState {}

final class RemoveProductInitial extends RemoveProductState {}

final class RemoveProductLoading extends RemoveProductState {}

final class RemoveProductSuccess extends RemoveProductState {}

final class RemoveProductFailure extends RemoveProductState {
  final String errMessage;
  RemoveProductFailure({required this.errMessage});
}
