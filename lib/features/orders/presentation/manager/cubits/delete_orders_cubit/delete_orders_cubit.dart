import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repos/orders_repo.dart';

part 'delete_orders_state.dart';

class DeleteOrdersCubit extends Cubit<DeleteOrdersState> {
  DeleteOrdersCubit({required this.ordersRepo}) : super(DeleteOrdersInitial());
  final OrdersRepo ordersRepo;
  Future<void> deleteOrder({required String orderID}) async {
    emit(DeleteOrdersLoading());
    var result = await ordersRepo.deleteOrder(orderID: orderID);
    result.fold(
      (failure) => emit(DeleteOrdersFailure(errorMessage: failure.message)),
      (success) => emit(DeleteOrdersSuccess()),
    );
  }
}
