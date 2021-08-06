import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_salary/app/data/ui_theme.dart';

getAppIcon(context) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.circle(),
          depth: 5,
          lightSource: LightSource.topLeft,
          shadowLightColor: ThemeController.to.isDarkTheme
              ? Colors.white.withOpacity(0.4)
              : Colors.white,
          shadowDarkColor:
              ThemeController.to.isDarkTheme ? Colors.black : Colors.black54,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Image.asset(
            ThemeController.to.isDarkTheme
                ? 'assets/images/dark_logo.png'
                : 'assets/images/light_logo.png',
            height: 55,
            width: 60,
          ),
        ),
      ),
    ],
  );
}
