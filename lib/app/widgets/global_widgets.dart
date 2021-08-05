import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:get/get.dart';
import 'package:net_salary/app/data/ui_theme.dart';

class GetButton extends StatelessWidget {
  GetButton(this.text, {this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 6.5,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
          depth: 5,
          lightSource: LightSource.topLeft,
          shadowLightColor: ThemeController.to.isDarkTheme
              ? Colors.white.withOpacity(0.4)
              : Colors.white,
          shadowDarkColor:
              ThemeController.to.isDarkTheme ? Colors.black : Colors.black54,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                ],
              ),
            ),
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff1e2123),
                  letterSpacing: 0.672,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
