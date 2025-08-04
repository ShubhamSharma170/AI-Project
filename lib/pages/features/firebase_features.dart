import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FireBaseFeatures {
  Future<void> signUP(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User Created");
    } on FirebaseAuthException catch (e) {
      log("Error... ${e.message}");
    }
  }
}
