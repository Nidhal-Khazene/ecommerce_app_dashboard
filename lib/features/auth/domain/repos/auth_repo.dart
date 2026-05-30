import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  );

  Future<void> addUserData({required UserEntity user});
  Future<void> saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
  Future<void> signOut();
}
