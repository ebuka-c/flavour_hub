import 'package:flavor_hub/constants/locals.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';

class SelectExpertise extends StatelessWidget {
  SelectExpertise({super.key});
  final radioGroupValue = 0.obs;
  final List<String> radioTitle = [
    'Beginner',
    'Intermediate',
    'Home Chef',
    'Professional Cook'
  ];

  @override
  Widget build(BuildContext context) {
    // var radioValue = [1, 2];
    String cookingLvl(int val) {
      switch (radioGroupValue.value) {
        case 0:
          return radioTitle[0];
        case 1:
          return radioTitle[1];
        case 2:
          return radioTitle[2];
        default:
          return radioTitle[3];
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 15),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Select your cooking expertise level',
                      textAlign: TextAlign.center,
                      style: titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  Text(
                    'Enhance your recipe recommendation based on your cooking level',
                    textAlign: TextAlign.center,
                    style: bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightText),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Obx(() {
                    return RadioListTile(
                      selectedTileColor: AppColors.appPrimary,
                      fillColor: WidgetStateProperty.resolveWith(
                          (state) => AppColors.appPrimary),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.lightText2, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      value: index,
                      groupValue: radioGroupValue.value,
                      onChanged: (val) {
                        radioGroupValue.value = val as int;
                      },
                      title: Text(radioTitle[index],
                          style: titleSmall.copyWith(
                              color: AppColors.primaryText)),
                    );
                  });
                },
                separatorBuilder: (_, __) => SizedBox(height: 10.0.h),
                itemCount: radioTitle.length),
            const Spacer(),
            AppButton(
              onTap: () {
                getStorageInstance.write(
                    COOKING_LEVEL, cookingLvl(radioGroupValue.value));
                Get.toNamed(AppRoutes.navBar);
              },
              text: 'Next',
            )
          ],
        ),
      ),
    );
  }
}
