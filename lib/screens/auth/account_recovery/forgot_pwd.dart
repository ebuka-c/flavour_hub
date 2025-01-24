import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/auth_textfield.dart';

final _formKey = GlobalKey<FormState>();

final _authC = Get.find<AuthController>();

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0.h, horizontal: 15.0.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password?',
                style: titleMedium.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 4.0.h),
              SizedBox(
                width: 319.0.w,
                child: Text(
                  'Don\'t worry! It happens, please enter the email address associated with your account',
                  style: bodyMedium.copyWith(color: AppColors.lightText2),
                ),
              ),
              SizedBox(height: 43.0.h),
              AuthTextField(
                controller: _authC.emailController,
                keyboardType: TextInputType.emailAddress,
                title: 'Email address',
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Field cannot be empty";
                  } else if (!GetUtils.isEmail(value ?? '')) {
                    return 'Invalid email';
                  }
                  return null;
                },
                bottomMargin: 250.0.h,
                hasSubtitle: false,
                obscureText: false,
              ),
              Obx(
                () => AppButton(
                  onTap: _authC.isLoading.value
                      ? null
                      : () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Get.toNamed(AppRoutes.otpScreen);
                            final response = await _authC.resetPwd();
                            if (response) {
                              Get.snackbar(
                                "Reset link sent to email",
                                "Check your email for a link to reset your email",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                icon: Icon(
                                  Icons.check_circle,
                                  color: AppColors.appPrimary,
                                ),
                                colorText: AppColors.primaryText,
                                duration: const Duration(seconds: 6),
                              );

                              Future.delayed(const Duration(seconds: 3), () {
                                Get.offAllNamed(AppRoutes.signInScreen);
                              });
                            }
                          }
                        },
                  width: double.infinity,
                  isLoading: _authC.isLoading.value ? true : false,
                  text: 'Send code',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
