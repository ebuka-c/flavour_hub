import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controllers/auth_controller.dart';

final _authC = Get.find<AuthController>();

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // values to track input & validity
    // final RxString emailInput = ''.obs;
    // final RxBool isEmailValid = true.obs;

    // void validateEmail(String value) {
    //   emailInput.value = value;
    //   isEmailValid.value = AppValidators.validateMyEmail(value);
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
    );
  }
}
