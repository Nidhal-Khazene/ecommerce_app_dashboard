import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/custom_exceptions.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception: Firebase.signInWithEmailAndPassword ${e.toString()} with code: ${e.code}.",
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: ".كلمة المرور صعيفة جدا");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "هناك حساب يستخدم نفس الإيميل.");
      } else {
        throw CustomException(message: "لقد حدث خطأ ما، يرجي المحاولة لاحقا!");
      }
    } catch (e) {
      log("Exception: Firebase.signInWithEmailAndPassword ${e.toString()}.");
      throw CustomException(message: "لقد حدث خطأ ما، يرجي المحاولة لاحقا!");
    }
  }

  static bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    return true;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
