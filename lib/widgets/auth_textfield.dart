import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';
import '../utilities/validators.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.onTap,
      this.focusNode,
      this.prefix,
      this.inputFormatters,
      required this.controller,
      required this.title,
      this.suffixIcon,
      required this.obscureText,
      this.keyboardType,
      this.textCapitalization,
      this.validator,
      this.autovalidateMode,
      this.titleStyle,
      this.prefixText,
      this.hintStyle,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.bordersideColor,
      required this.hasSubtitle,
      this.subtitle,
      this.alternativeField,
      this.focusedBorderWidth,
      this.hintText,
      this.readOnly,
      this.enabledBorderWidth,
      this.filled,
      required this.bottomMargin,
      this.fieldAction,
      this.minHeight,
      this.maxHeight,
      this.onChanged,
      this.borderRadius,
      this.errorBorder,
      this.focusedBorder,
      this.enabledBorder,
      this.maxlines});
  final TextEditingController controller;
  final String title;
  final String? subtitle, prefixText, hintText;
  final TextStyle? titleStyle, hintStyle;
  final Widget? suffixIcon, alternativeField, fieldAction;
  final bool obscureText, hasSubtitle;
  final bool? filled, readOnly;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Color? enabledBorderColor, focusedBorderColor, bordersideColor;
  final double? focusedBorderWidth,
      enabledBorderWidth,
      minHeight,
      maxHeight,
      borderRadius;
  final double bottomMargin;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final InputBorder? errorBorder, focusedBorder, enabledBorder;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasSubtitle
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: titleSmall),
                SizedBox(height: 4.0.h),
                Text(subtitle ?? '',
                    style: bodyMedium.copyWith(color: AppColors.primaryText))
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: titleStyle ?? bodyMedium),
                  fieldAction ?? const SizedBox()
                ],
              ),
        SizedBox(height: 6.0.h),
        Container(
          margin: EdgeInsets.only(bottom: bottomMargin),
          // height: 56.0.h,
          constraints: BoxConstraints(
              minHeight: minHeight ?? 56.0.h,
              maxHeight: maxHeight ?? double.infinity),
          child: alternativeField ??
              TextFormField(
                controller: controller,
                onTap: onTap,
                style: titleSmall,
                onChanged: onChanged,
                keyboardType: keyboardType,
                obscuringCharacter: '*',
                focusNode: focusNode,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                inputFormatters: inputFormatters,
                validator: validator ?? AppValidators.validateEmptyField,
                autovalidateMode: autovalidateMode,
                cursorWidth: 1,
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                  filled: true,
                  prefixText: prefixText,
                  hintText: hintText,
                  hintStyle: bodyMedium.copyWith(color: AppColors.lightText2),
                  fillColor: Colors.grey.withOpacity(0.15),
                  errorBorder: errorBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                bordersideColor ?? AppColors.textfieldBorder),
                        borderRadius: BorderRadius.circular(16),
                      ),
                  focusedErrorBorder: focusedBorder ??
                      OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.errorBorder),
                          borderRadius: BorderRadius.circular(16)),
                  enabledBorder: enabledBorder ??
                      OutlineInputBorder(
                          borderSide: BorderSide(
                              width: enabledBorderWidth ?? 1,
                              color: enabledBorderColor ??
                                  AppColors.textfieldBorder),
                          borderRadius:
                              BorderRadius.circular(borderRadius ?? 16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: focusedBorderWidth ?? 1.5,
                          color:
                              focusedBorderColor ?? AppColors.textfieldBorder),
                      borderRadius: BorderRadius.circular(16)),
                  prefix: prefix,
                  suffixIcon: suffixIcon,
                ),
                obscureText: obscureText,
                maxLines: maxlines,
              ),
        )
      ],
    );
  }
}
