import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/auth/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      emailAddress,
      password,
    );
    result.fold((failure) => emit(SignInFailure(failure.message)), (
      userEntity,
    ) {
      if (userEntity.isAdmin) {
        emit(SignInSuccess(userEntity: userEntity));
      } else {
        emit(SignInFailure("أنت لست آدمن! تواصل مع مع فريق الدعم للإستفسار."));
      }
    });
  }
}
