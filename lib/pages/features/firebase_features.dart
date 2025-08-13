import 'dart:developer';

import 'package:ai_project/helper/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireBaseFeatures extends GetxController {
  var isLoading = false.obs;
  // sign up
  Future<bool> signUP(String email, String password) async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User Created");
      isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      log("Error... ${e.message}");
      Get.snackbar(
        "",
        titleText: Text("Error", style: TextStyle(color: white)),
        "",
        messageText: Text(e.message.toString(), style: TextStyle(color: white)),
        backgroundColor: red,
      );
      isLoading.value = false;
      return false;
    }
  }

  // sign in
  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        isLoading.value = false;
        Get.snackbar(
          "",
          titleText: Text("Success", style: TextStyle(color: white)),
          "",
          messageText: Text(
            "Login Successfully",
            style: TextStyle(color: white),
          ),
          backgroundColor: green,
        );
        return true;
      }
      isLoading.value = false;
      return false;
    } on FirebaseException catch (e) {
      log("Error... ${e.message}");
      Get.snackbar(
        "",
        titleText: Text("Error", style: TextStyle(color: white)),
        "",
        messageText: Text(e.message.toString(), style: TextStyle(color: white)),
        backgroundColor: red,
      );
      isLoading.value = false;
      return false;
    }
  }
}
