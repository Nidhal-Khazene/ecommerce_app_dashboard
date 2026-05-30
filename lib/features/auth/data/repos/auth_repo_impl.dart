import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants.dart';
import '../../../../core/errors/custom_exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/backend_break_point.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      var userCredential = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );
      UserEntity userEntity = await getUserData(uId: userCredential.user!.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Exception: Firebase.signInWithEmailAndPassword ${e.toString()}.");
      return left(
        ServerFailure(message: 'لقد حدث خطأ ما يرجى المحاولة لاحقا.'),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendBreakPoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.userId,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      documentsId: uId,
      path: BackendBreakPoint.getUserData,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kSaveDataSharedPref, jsonData);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    await SharedPreferencesSingleton.remove(kSaveDataSharedPref);
  }
}
