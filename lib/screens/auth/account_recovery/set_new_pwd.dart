// import 'package:flavor_hub/utilities/extensions.dart';
// import 'package:flavor_hub/utilities/validators.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../constants/colors.dart';
// import '../../../constants/custom_textstyles.dart';
// import '../../../controllers/auth_controller.dart';
// import '../../../page_routes/route_name.dart';
// import '../../../widgets/app_button.dart';
// import '../../../widgets/auth_textfield.dart';

// final _authC = Get.find<AuthController>();

// final _formKey = GlobalKey<FormState>();

// class SetNewPwd extends StatelessWidget {
//   const SetNewPwd({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Reset Password',
//                   style: titleMedium.copyWith(fontWeight: FontWeight.w700)),
//               SizedBox(height: 4.0.h),
//               SizedBox(
//                 width: 319.0.w,
//                 child: Text(
//                   'Please set a password you\'ll remember',
//                   style: bodyMedium.copyWith(
//                     color: AppColors.lightText2,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 43.0.h),
//               Obx(
//                 () => AuthTextField(
//                   controller: _authC.newPassword,
//                   title: 'New password',
//                   hasSubtitle: false,
//                   validator: AppValidators.newPswdValidator,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   obscureText: _authC.passwordObscure.value,
//                   bottomMargin: 22.0.h,
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       _authC.passwordObscure.value =
//                           !_authC.passwordObscure.value;
//                     },
//                     child: Icon(
//                         _authC.passwordObscure.value
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                         color: AppColors.textfieldBorder),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => AuthTextField(
//                   controller: _authC.confirmPasswordController,
//                   title: 'Confirm new password',
//                   hasSubtitle: false,
//                   bottomMargin: 120.0.h,
//                   obscureText: _authC.confirmPasswordObscure.value,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Field cannnot be empty';
//                     } else if (value != _authC.newPassword.text) {
//                       return "Password mismatch";
//                     }
//                     return null;
//                   },
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       _authC.confirmPasswordObscure.value =
//                           !_authC.confirmPasswordObscure.value;
//                     },
//                     child: Icon(
//                       _authC.confirmPasswordObscure.value
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: AppColors.textfieldBorder,
//                     ),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => AppButton(
//                   onTap: _authC.isLoading.value
//                       ? null
//                       : () async {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             //   final response = await controller
//                             //       .completePasswordReset(otp: otp);
//                             //   appSnackbar(response);
//                             //   if (response.isSuccessful ?? false) {
//                             //     Get.to(const AdminPwdResetSuccess());
//                             //   }
//                           }
//                         },
//                   text: 'Reset',
//                   width: double.infinity,
//                   isLoading: _authC.isLoading.value ? true : false,
//                 ),
//               ),
//               SizedBox(height: 23.0.h),
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Remembered your password? ',
//                     style: bodyLarge.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.lightText2),
//                     children: [
//                       TextSpan(
//                         text: 'Login',
//                         style: bodyLarge.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.primaryText),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Get.offAllNamed(AppRoutes.signInScreen);
//                           },
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
