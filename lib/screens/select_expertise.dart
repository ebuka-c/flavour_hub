import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';

class SelectExpertise extends StatelessWidget {
  const SelectExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    var radioGroupValue = 0.obs;
    // var radioValue = [1, 2];
    List<String> radioTitle = [
      'Beginner',
      'Intermediate',
      'Home Chef',
      'Professional Cook'
    ];

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
                    child: Text('Select your cooking expertise level',
                        textAlign: TextAlign.center,
                        style:
                            titleMedium.copyWith(fontWeight: FontWeight.bold)),
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
