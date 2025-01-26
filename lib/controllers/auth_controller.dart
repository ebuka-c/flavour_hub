import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/colors.dart';
import '../page_routes/route_name.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final nameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final emailController = TextEditingController();
  final signUpPwdC = TextEditingController();
  final loginPwdController = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordObscure = true.obs;
  final confirmPasswordObscure = true.obs;

  final acceptTerms = false.obs;

  void toggleAcceptTerms(bool value) {
    acceptTerms.value = value;
    if (value == true) {
      if (kDebugMode) print('accepted');
    }
  }

  final correctOtp = ''.obs;

  var isLoading = false.obs;

  Future<bool> signUpwEmailPwd(String email, String pwd) async {
    isLoading.value = true;
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);

      // Update the user's display name
      await userCredential.user!.updateDisplayName(nameController.text.trim());

      // Save the user's name to Firestore (optional)
      // await _firestore.collection('users').doc(userCredential.user!.uid).set({
      //   'name': nameController.text.trim(),
      //   'email': email,
      // });
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.withOpacity(0.2),
        icon: Icon(
          CupertinoIcons.exclamationmark_circle,
          color: AppColors.appRed,
        ),
        colorText: AppColors.primaryText,
        duration: const Duration(seconds: 5),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //login
  Future<bool> loginwEmailPwd(String email, String pwd) async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      // print(userCredential.user?.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.withOpacity(0.2),
        icon: Icon(
          CupertinoIcons.exclamationmark_circle,
          color: AppColors.appRed,
        ),
        colorText: AppColors.primaryText,
        duration: const Duration(seconds: 5),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //login
  Future<bool> resetPwd() async {
    isLoading.value = true;
    try {
      if (kDebugMode) print(emailController.text.trim());
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.withOpacity(0.2),
        icon: Icon(
          CupertinoIcons.exclamationmark_circle,
          color: AppColors.appRed,
        ),
        colorText: AppColors.primaryText,
        duration: const Duration(seconds: 5),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //logout
  Future<bool> logout() async {
    isLoading.value = true;
    try {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.signInScreen);
      if (kDebugMode) print('sign out success');
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.errorBorder,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
