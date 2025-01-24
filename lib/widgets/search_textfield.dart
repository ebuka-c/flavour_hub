import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputBorder,
    this.maxLines,
    this.hintStyle,
    this.contentPadding,
    this.cursorColor,
    this.cursorHeight,
    this.textStyle,
    this.focusedBorder,
    this.padding,
    this.onChanged,
    this.enabledWidth,
    this.enabledRadius,
    this.focusedWidth,
    this.focusedRadius,
    this.borderColor,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle, textStyle;
  final EdgeInsetsGeometry? contentPadding, padding;
  final String? hintText;
  final Color? fillColor, cursorColor, borderColor;
  final Widget? suffixIcon, prefixIcon;
  final InputBorder? inputBorder, focusedBorder;
  final int? maxLines;
  final double? cursorHeight,
      enabledWidth,
      enabledRadius,
      focusedWidth,
      focusedRadius;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0.h,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: TextField(
          style: bodyLarge,
          keyboardType: keyboardType,
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,
          maxLines: maxLines,
          cursorColor: AppColors.lightText2,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: enabledWidth ?? 1,
                      color: borderColor ?? AppColors.textfieldBorder),
                  borderRadius: BorderRadius.circular(enabledRadius ?? 16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: focusedWidth ?? 1,
                      color: borderColor ?? AppColors.textfieldBorder),
                  borderRadius: BorderRadius.circular(focusedRadius ?? 24)),
              hintText: hintText,
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(vertical: 5.0.h),
              hintStyle:
                  hintStyle ?? bodyLarge.copyWith(color: AppColors.lightText2),
              fillColor: AppColors.white,
              suffixIcon: suffixIcon,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.lightText2,
              ),
              filled: true),
        ));
  }
}
/**
 * hintText: 'Search by name or category',
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.opacityDarkText3,
                        ),
 */
