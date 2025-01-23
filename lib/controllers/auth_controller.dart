import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final emailController = TextEditingController();
  final signUpPwdC = TextEditingController();
  final loginPwdController = TextEditingController();
  final passwordObscure = true.obs;

  final acceptTerms = false.obs;

  void toggleAcceptTerms(bool value) {
    acceptTerms.value = value;
    if (value == true) {
      print('accepted');
    }
  }

  var isLoading = false.obs;
}
