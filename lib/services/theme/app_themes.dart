import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';

class AppThemes {
  final lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
          color: AppColors.appBackground,
          elevation: 0,
          titleTextStyle: titleMedium),
      primaryTextTheme: TextTheme(
          titleSmall: titleSmall.copyWith(color: AppColors.primaryText)),
      scaffoldBackgroundColor: AppColors.appBackground,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.appPrimary,
      ),
      textTheme: TextTheme(
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.appPrimary,
          unselectedItemColor: AppColors.lightText));
}
