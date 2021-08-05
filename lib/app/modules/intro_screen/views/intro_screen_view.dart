import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/data/ui_theme.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/routes/app_pages.dart';

class IntroScreenView extends StatefulWidget {
  @override
  _IntroScreenViewState createState() => _IntroScreenViewState();
}

class _IntroScreenViewState extends State<IntroScreenView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(Routes.HOME));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ThemeController.to.isDarkTheme
                  ? 'assets/images/dark_logo.png'
                  : 'assets/images/light_logo.png',
              height: 55,
              width: 60,
            ),
            SizedBox(
              height: KDynamicWidth.width10,
            ),
            Text(
              'NetSalary',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 35,
                color: ThemeController.to.theme.primaryColor,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
