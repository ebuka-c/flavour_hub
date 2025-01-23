import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension AppIntSizer on int {
  int get h {
    final context = Get.context;
    if (context != null) {
      return (MediaQuery.of(context).size.height * (this / 844)).toInt();
    } else {
      // Handle the case when context is null
      return this; // or some default value
    }
  }

  int get w {
    final context = Get.context;
    if (context != null) {
      return (MediaQuery.of(context).size.width * (this / 390)).toInt();
    } else {
      // Handle the case when context is null
      return this; // or some default value
    }
  }
}

extension AppDoubleSizer on double {
  double get h {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size.height * (this / 844);
    } else {
      // Handle the case when context is null
      return this; // or some default value
    }
  }

  double get w {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size.width * (this / 390);
    } else {
      // Handle the case when context is null
      return this; // or some default value
    }
  }

  EdgeInsetsGeometry get padAll => EdgeInsets.all(h.h);
  EdgeInsetsGeometry get padLeft => EdgeInsets.only(left: w.w);
  EdgeInsetsGeometry get padRight => EdgeInsets.only(right: w.w);
  EdgeInsetsGeometry get padTop => EdgeInsets.only(top: h.h);
  EdgeInsetsGeometry get padBottom => EdgeInsets.only(bottom: h.h);
  EdgeInsetsGeometry get padVert => EdgeInsets.symmetric(vertical: h.h);
  EdgeInsetsGeometry get padHoriz => EdgeInsets.symmetric(horizontal: w.w);

  Widget get sizedBoxH => SizedBox(height: h.h);
  Widget get sizedBoxW => SizedBox(width: w.w);
}
