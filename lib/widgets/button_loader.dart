import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator(
      {super.key, this.size, this.strokeWidth, this.color, this.valueColor});
  final double? size, strokeWidth;
  final Color? color, valueColor;

  @override
  Widget build(context) {
    return SizedBox(
      width: size ?? 25,
      height: size ?? 25,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            valueColor ?? AppColors.appBackground),
        backgroundColor: color ?? Colors.white.withOpacity(0.2),
        strokeWidth: strokeWidth ?? 2,
      ),
    );
  }
}
