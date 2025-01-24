// import 'package:flavor_hub/page_routes/route_name.dart';
// import 'package:flavor_hub/utilities/extensions.dart';
// import 'package:flavor_hub/utilities/validators.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:pinput/pinput.dart';
// import '../../../constants/colors.dart';
// import '../../../constants/custom_textstyles.dart';
// import '../../../controllers/auth_controller.dart';
// import '../../../widgets/app_button.dart';

// final _formKey = GlobalKey<FormState>();

// final _authC = Get.find<AuthController>();

// class PwdResetOtp extends StatefulWidget {
//   const PwdResetOtp({super.key});

//   @override
//   State<PwdResetOtp> createState() => _PwdResetOtpState();
// }

// class _PwdResetOtpState extends State<PwdResetOtp> {
//   bool isTimerActive = true;

//   late DateTime endTime;

//   @override
//   void initState() {
//     super.initState();
//     resetTimer(); // Initialize the timer
//   }

//   void resetTimer() {
//     setState(() {
//       endTime =
//           DateTime.now().add(const Duration(seconds: 90)); // Reset to 5 minutes
//       isTimerActive = true; // Set timer active
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     resetTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Please check your email',
//                 style: titleMedium.copyWith(fontWeight: FontWeight.w700),
//               ),
//               SizedBox(height: 4.0.h),
//               RichText(
//                 text: TextSpan(
//                   text: 'We\'ve sent a code to ',
//                   style: bodyLarge,
//                   children: [
//                     TextSpan(
//                       text: _authC.emailController.text,
//                       style: bodyLarge.copyWith(fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 43.0.h),
//               Pinput(
//                 length: 4,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 validator: AppValidators.validatePin,
//                 errorTextStyle: titleSmall.copyWith(color: AppColors.appRed),
//                 defaultPinTheme: PinTheme(
//                   height: 70.0.h,
//                   width: 70.0.w,
//                   textStyle: titleMedium.copyWith(
//                     color: AppColors.primaryText,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: const Color(0xffC4C4C4),
//                     ),
//                   ),
//                 ),
//                 onCompleted: (value) {
//                   _authC.correctOtp.value = value;
//                 },
//               ),
//               SizedBox(height: 250.0.h),
//               Obx(
//                 () => AppButton(
//                   onTap: _authC.isLoading.value
//                       ? null
//                       : () async {
//                           var otp = _authC.correctOtp.value;
//                           if (_formKey.currentState?.validate() ?? false) {
//                             //   final response =
//                             //       await _authC.verifyPasswordResetToken(otp);
//                             //   appSnackbar(response);
//                             //   if (response.isSuccessful ?? false) {
//                             //     Get.to(AdminPasswordReset(otp));
//                             //   }
//                             //   // verifyPin();
//                             Get.toNamed(AppRoutes.setNewPwd);
//                           }
//                         },
//                   width: double.infinity,
//                   isLoading: _authC.isLoading.value ? true : false,
//                   text: 'Verify',
//                 ),
//               ),
//               SizedBox(height: 43.0.h),
//               isTimerActive
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Send code again in  ',
//                           style:
//                               bodyLarge.copyWith(fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(width: 8.0.w),
//                         TimerCountdown(
//                           format: CountDownTimerFormat.minutesSeconds,
//                           enableDescriptions: false,
//                           endTime: DateTime.now().add(
//                             const Duration(seconds: 60),
//                           ),
//                           onEnd: () {
//                             setState(() {
//                               isTimerActive =
//                                   false; // Deactivate timer when it ends
//                             });
//                           },
//                         )
//                       ],
//                     )
//                   : GestureDetector(
//                       onTap: _authC.isLoading.value
//                           ? null
//                           : () {
//                               // _authC.resendPasswordReset();
//                               // if (_authC.resetCountdownTimer.value) {
//                               //   resetTimer(); // Restart the timer on tap
//                               // }
//                             },
//                       child: Text(
//                         "Resend",
//                         style: bodyLarge.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.appPrimary,
//                         ),
//                       ),
//                     )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
