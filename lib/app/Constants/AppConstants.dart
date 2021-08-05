import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KColors {
  static const Color BG_LIGHT = Color(0xffE0EFFF);
  static const Color BLUE_light = Color(0xffBCD7FF);
  static const Color BLUE_dark = Color(0xff62a1ff);
  static const Color BG_DARK = Color(0xff1E2123);
  static const Color BROWN_light = Color(0xffCFB299);
  static const Color BROWN_dark = Color(0xff62554A);
}

class KTextStyle {
  static const TextStyle f18w5 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle f13w5 =
      TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  static const TextStyle f12w4 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  static const TextStyle f14w4 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const TextStyle f16w5 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}

class KDynamicWidth {
  static double width20 = Get.width / 17;
  static double width16 = Get.width / 25;
  static double width10 = Get.width / 40;
  static double width50 = Get.width / 9;
}
