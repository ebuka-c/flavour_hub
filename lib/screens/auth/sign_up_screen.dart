import 'package:flavor_hub/constants/locals.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../constants/images.dart';
import '../../controllers/auth_controller.dart';
import '../../page_routes/route_name.dart';
import '../../utilities/validators.dart';
import '../../widgets/app_button.dart';
import '../../widgets/auth_textfield.dart';

final _authC = Get.find<AuthController>();

final _formKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // values to track input & validity
    final RxString emailInput = ''.obs;
    final RxBool isEmailValid = true.obs;

    void validateEmail(String value) {
      emailInput.value = value;
      isEmailValid.value = AppValidators.validateMyEmail(value);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 100.0.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text('Create Account',
                          style: titleMedium.copyWith(
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 30.0.h),
                  AuthTextField(
                      controller: _authC.nameController,
                      keyboardType: TextInputType.name,
                      title: 'Full name',
                      bordersideColor:
                          isEmailValid.value ? null : AppColors.errorBorder,
                      enabledBorderColor:
                          isEmailValid.value ? null : AppColors.errorBorder,
                      focusedBorderColor:
                          isEmailValid.value ? null : AppColors.errorBorder,
                      suffixIcon: emailInput.value.isNotEmpty
                          ? Icon(
                              isEmailValid.value
                                  ? Icons.check_circle
                                  : CupertinoIcons.exclamationmark_circle,
                              color: isEmailValid.value
                                  ? Colors.green
                                  : Colors.red,
                            )
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      bottomMargin: 14.0.h,
                      hasSubtitle: false,
                      obscureText: false),
                  Obx(() {
                    return AuthTextField(
                        controller: _authC.signUpEmailController,
                        keyboardType: TextInputType.emailAddress,
                        title: 'Email address',
                        bordersideColor:
                            isEmailValid.value ? null : AppColors.errorBorder,
                        enabledBorderColor:
                            isEmailValid.value ? null : AppColors.errorBorder,
                        focusedBorderColor:
                            isEmailValid.value ? null : AppColors.errorBorder,
                        suffixIcon: emailInput.value.isNotEmpty
                            ? Icon(
                                isEmailValid.value
                                    ? Icons.check_circle
                                    : CupertinoIcons.exclamationmark_circle,
                                color: isEmailValid.value
                                    ? Colors.green
                                    : Colors.red,
                              )
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: validateEmail,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Field cannot be empty";
                          } else if (!GetUtils.isEmail(value ?? '')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        bottomMargin: 14.0.h,
                        hasSubtitle: false,
                        obscureText: false);
                  }),
                  Obx(() {
                    return AuthTextField(
                        controller: _authC.signUpPwdC,
                        title: 'Password',
                        hasSubtitle: false,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _authC.passwordObscure.value =
                                !_authC.passwordObscure.value;
                          },
                          child: Icon(
                            _authC.passwordObscure.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.primaryText,
                          ),
                        ),
                        bottomMargin: 16.0.h,
                        maxlines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: AppValidators.strongPswdValidator,
                        obscureText: _authC.passwordObscure.value);
                  }),
                  Row(
                    children: [
                      Obx(() {
                        return Checkbox(
                          checkColor: AppColors.white,
                          fillColor: WidgetStateProperty.resolveWith(
                              (state) => AppColors.appPrimary),
                          value: _authC.acceptTerms.value,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onChanged: (bool? value) {
                            _authC.toggleAcceptTerms(value ?? false);
                          },
                        );
                      }),
                      RichText(
                        text: TextSpan(
                          text: 'I agree to ',
                          style: bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightText),
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: bodyMedium.copyWith(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  color: AppColors.primaryText),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h),
                  Obx(() {
                    return AppButton(
                      onTap: (!_authC.acceptTerms.value ||
                              _authC.isLoading.value)
                          ? null
                          : () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                var status = await _authC.signUpwEmailPwd(
                                    _authC.signUpEmailController.text.trim(),
                                    _authC.signUpPwdC.text.trim());

                                if (status) {
                                  getStorageInstance.write(USER_NAME,
                                      _authC.nameController.text.trim());
                                  Get.toNamed(AppRoutes.selectExpertise);
                                }
                              }
                            },
                      isLoading: _authC.isLoading.value ? true : false,
                      text: 'Create an account',
                      textColor: _authC.acceptTerms.value
                          ? AppColors.white
                          : AppColors.lightText2,
                      btnColor: _authC.acceptTerms.value
                          ? AppColors.appPrimary
                          : AppColors.inactiveBtnState,
                    );
                  }),
                  SizedBox(height: 20.0.h),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                            color: AppColors.inactiveBtnState,
                            endIndent: 8.0.w),
                      ),
                      Text(
                        'Or',
                        style: bodyMedium.copyWith(color: AppColors.lightText2),
                      ),
                      Expanded(
                        child: Divider(
                            color: AppColors.inactiveBtnState, indent: 8.0.w),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h),
                  AppButton(
                    onTap: () {},
                    btnColor: AppColors.white,
                    border:
                        Border.all(width: 1, color: AppColors.textfieldBorder),
                    btnChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.google,
                          width: 18.0.w,
                          height: 18.0.h,
                        ),
                        SizedBox(width: 10.0.w),
                        Text(
                          'Sign up with Google',
                          style:
                              titleSmall.copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 14.0.h),
                  SizedBox(height: 40.0.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: bodyLarge.copyWith(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: AppColors.primaryText),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAllNamed(AppRoutes.signInScreen);
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
