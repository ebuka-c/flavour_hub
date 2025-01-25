import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';
import 'button_loader.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onTap,
      this.text,
      this.btnColor,
      this.border,
      this.textColor,
      this.isLoading,
      this.textStyle,
      this.padding,
      this.btnChild,
      this.width,
      this.margin,
      this.radius,
      this.height});
  final Function()? onTap;
  final String? text;
  final Color? btnColor, textColor;
  final bool? isLoading;
  final Widget? btnChild;
  final TextStyle? textStyle;
  final BoxBorder? border;
  final double? width, height, radius;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 57.0.h,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 16),
          border: border,
          color: btnColor ?? AppColors.appPrimary,
        ),
        child: Center(
          child: btnChild ??
              ((isLoading ?? false)
                  ? const AppLoadingIndicator()
                  : Text(
                      text ?? '',
                      style: textStyle ??
                          titleSmall.copyWith(
                              color: textColor ?? AppColors.white,
                              fontWeight: FontWeight.w700),
                    )),
        ),
      ),
    );
  }
}

/**Text(
            text,
            style: titleSmall.copyWith(
                color: textColor ?? AppColors.white,
                fontWeight: FontWeight.w700),
          ), */
