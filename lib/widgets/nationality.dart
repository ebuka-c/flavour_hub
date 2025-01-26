import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';

class Nationality extends StatelessWidget {
  const Nationality({super.key, required this.nationality});
  final String nationality;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.0.w,
          height: 20,
          decoration: BoxDecoration(
              color: AppColors.appPrimary,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(width: 4.0.h),
        Text(
          nationality,
          style: bodySmall.copyWith(color: AppColors.appPrimary),
        )
      ],
    );
  }
}
