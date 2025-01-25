import 'package:flavor_hub/controllers/auth_controller.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../widgets/app_button.dart';

Future<bool>? logOutDialog({
  required BuildContext context,
}) async {
  final controller = Get.find<AuthController>();

  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            backgroundColor: AppColors.white,
            scrollable: true,
            elevation: 20,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            content: Column(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(
                    child: Text('Log out',
                        textAlign: TextAlign.center, style: titleMedium)),
                SizedBox(height: 12.0.h),
                SizedBox(
                    width: 260.0.w,
                    child: Text(
                        'Are you sure you want to log out? You\'ll need to login again to use the app.',
                        textAlign: TextAlign.center,
                        style: bodyLarge.copyWith(color: AppColors.lightText))),
                SizedBox(height: 28.0.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                          onTap: () {
                            Get.back(result: false);
                          },
                          border:
                              Border.all(color: AppColors.lightText2, width: 1),
                          height: 40.0.h,
                          btnColor: AppColors.white,
                          padding: EdgeInsets.symmetric(horizontal: 34.5.w),
                          textStyle: bodyMedium.copyWith(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600),
                          text: 'Cancel'),
                      Obx(() {
                        return AppButton(
                          onTap: () {
                            Get.back(result: true);
                          },
                          height: 40.0.h,
                          padding: EdgeInsets.symmetric(horizontal: 34.5.w),
                          isLoading: controller.isLoading.value ? true : false,
                          textStyle: bodyMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          btnColor: AppColors.appPrimary,
                          text: 'Log out',
                        );
                      })
                    ])
              ])
            ]));
      });
}
