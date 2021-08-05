import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find(); // for using everywhere

  final box = GetStorage();
  bool get isDarkTheme => box.read('dark') ?? false;
  ThemeData get theme =>
      isDarkTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme;
  void changeTheme(bool val) => box.write('dark', val);
}

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      primaryColorDark: KColors.BLUE_dark,
      primaryColorLight: Colors.black,
      primaryColor: KColors.BLUE_light,
      scaffoldBackgroundColor: KColors.BG_LIGHT,
      backgroundColor: KColors.BG_LIGHT,
      fontFamily: 'Montserrat',
      dividerColor: Colors.grey,
      appBarTheme: AppBarTheme(
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        centerTitle: true,
        backgroundColor: KColors.BG_LIGHT,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    //2
    return ThemeData(
      primaryColorDark: KColors.BROWN_dark,
      primaryColorLight: KColors.BROWN_light,
      backgroundColor: KColors.BROWN_light,
      primaryColor: KColors.BROWN_light,
      scaffoldBackgroundColor: KColors.BG_DARK,
      fontFamily: 'Montserrat',
      dividerColor: Colors.grey.withOpacity(0.6),
      appBarTheme: AppBarTheme(
        titleTextStyle:
            TextStyle(color: KColors.BROWN_light, fontWeight: FontWeight.w400),
        backgroundColor: KColors.BG_DARK,
        centerTitle: true,
        iconTheme: IconThemeData(color: KColors.BROWN_light),
      ),
    );
  }
}
