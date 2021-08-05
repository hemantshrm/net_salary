import 'package:clay_containers/clay_containers.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/data/ui_theme.dart';
import 'package:net_salary/app/modules/createprofile/views/createprofile_view.dart';
import 'package:net_salary/app/modules/signup/views/signup_view.dart';
import 'package:net_salary/app/routes/app_pages.dart';
import 'package:net_salary/app/widgets/AppIcon.dart';
import 'package:net_salary/app/widgets/global_widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          padding: EdgeInsets.all(KDynamicWidth.width20),
          shrinkWrap: true,
          children: [
            getAppIcon(context),
            SizedBox(
              height: KDynamicWidth.width16,
            ),
            buildHeadingTexts(context, 'NetSalary'),
            SizedBox(
              height: KDynamicWidth.width20,
            ),
            buildHeadingTexts(
                context, 'Calculate your take Home Pay in a jiffy'),
            SizedBox(
              height: KDynamicWidth.width20 + KDynamicWidth.width10,
            ),
            getEmailPassFields(context, 'Email Address', 'Enter Email', false),
            SizedBox(
              height: 30,
            ),
            getEmailPassFields(context, 'Password', 'Enter Password', true),
            SizedBox(
              height: KDynamicWidth.width20,
            ),
            GetButton('Sign In', onTap: () {
              Get.to(() => CreateProfileView());
            }),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: KDynamicWidth.width20,
              ),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
                  child: Text(
                    "Or Sign In using",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColorLight),
                  ),
                ),
                Expanded(child: Divider()),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width / 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconImageContainer(
                      context, 'assets/images/facebook_icon.png'),
                  iconImageContainer(context, 'assets/images/google.png'),
                  iconImageContainer(
                      context,
                      ThemeController.to.isDarkTheme
                          ? 'assets/images/apple_dark.png'
                          : 'assets/images/apple_icon.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: KDynamicWidth.width20,
              ),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColorLight),
                  ),
                ),
                Expanded(child: Divider()),
              ]),
            ),
            GetButton('Continue as Guest', onTap: () {
              Get.toNamed(Routes.DASHBOARD);
            }),
            SizedBox(height: KDynamicWidth.width20),
            Container(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => SignupView());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextforSignupLine(
                        'New user?', Theme.of(context).primaryColorLight),
                    SizedBox(
                      width: KDynamicWidth.width10,
                    ),
                    buildTextforSignupLine(
                        'Sign Up', Theme.of(context).primaryColorDark),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Text buildHeadingTexts(BuildContext context, title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 16,
      color: Theme.of(context).primaryColorLight,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
    textAlign: TextAlign.center,
  );
}

Text buildTextforSignupLine(_t, _color) {
  return Text(
    _t,
    style: TextStyle(
      fontSize: 14,
      color: _color,
      letterSpacing: 0.672,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.left,
  );
}

iconImageContainer(BuildContext context, String image) {
  return Container(
    height: 50,
    width: 50,
    child: CustomNmorphicForTextFields(
        Container(
            child: Center(
          child: Image.asset(
            image,
            height: 24,
            width: 24,
          ),
        )),
        7),
  );
}

getEmailPassFields(
    BuildContext context, String heading, String hint, bool isIcon) {
  return Container(
    height: Get.width / 6,
    child: Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(17)),
        depth: 5,
        lightSource: LightSource.topLeft,
        shadowLightColor: ThemeController.to.isDarkTheme
            ? Colors.white.withOpacity(0.4)
            : Colors.white,
        shadowDarkColor:
            ThemeController.to.isDarkTheme ? Colors.black : Colors.black54,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: KDynamicWidth.width20),
          child: Container(
            height: 35,
            child: TextField(
              style: KTextStyle.f15w4
                  .copyWith(color: Theme.of(context).primaryColorLight),
              maxLength: 30,
              decoration: InputDecoration(
                  counterText: '',
                  labelText: heading,
                  labelStyle: KTextStyle.f15w4
                      .copyWith(color: Theme.of(context).primaryColorLight),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: '$hint',
                  hintStyle: KTextStyle.f15w4
                      .copyWith(color: Theme.of(context).primaryColorLight),
                  suffixIcon: isIcon
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Theme.of(context).primaryColor,
                        )
                      : null),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    ),
  );
}

getEditTextWithoutIconlongtext(String heading, String hint, {bool isNum}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
    child: FittedBox(
      child: ClayContainer(
        height: 90,
        width: Get.width,
        borderRadius: 15,
        color: Color(0xffe0efff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
              child: Container(
                height: 45,
                child: Text(
                  '$heading',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff2c2c2c),
                    letterSpacing: 0.5760000000000001,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: KDynamicWidth.width20),
              child: Container(
                height: 30,
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: const Color(0xff2c2c2c),
                    letterSpacing: 0.672,
                  ),
                  inputFormatters: [
                    isNum != null
                        ? CurrencyTextInputFormatter(
                            locale: 'Hi',
                            decimalDigits: 0,
                            symbol: '',
                          )
                        : FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                  ],
                  keyboardType:
                      isNum != null ? TextInputType.number : TextInputType.text,
                  maxLength: isNum != null ? 11 : 30,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.only(bottom: 14),
                    border: InputBorder.none,
                    hintText: '$hint',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

getEditTextWithoutIconwithLongText(String heading, String text, {bool isNum}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
    child: FittedBox(
      child: ClayContainer(
        height: 130,
        width: Get.width,
        borderRadius: 15,
        color: Color(0xffe0efff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
              child: Container(
                height: 30,
                child: Text(
                  '$heading',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff2c2c2c),
                    letterSpacing: 0.5760000000000001,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: KDynamicWidth.width20),
              child: Container(
                height: 80,
                child: Text(
                  text,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff2c2c2c),
                    letterSpacing: 0.672,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

getEditTextWithoutIconwithDropDown(String heading, String hint, _dropDownValue,
    {Function onChange(value)}) {
  final List<int> items = <int>[0, 1, 2];
  return Container(
    margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
    child: FittedBox(
      child: ClayContainer(
        height: 60,
        width: Get.width,
        borderRadius: 15,
        color: Color(0xffe0efff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
              child: Container(
                height: 22,
                child: Text(
                  '$heading',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff2c2c2c),
                    letterSpacing: 0.5760000000000001,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 30,
              child: DropdownButton(
                underline: SizedBox(),
                value: _dropDownValue,
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.black),
                items: [0, 1, 2].map(
                  (val) {
                    return DropdownMenuItem<int>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  },
                ).toList(),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((int item) {
                    return Container(
                        margin: EdgeInsets.only(left: KDynamicWidth.width20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 18),
                        ));
                  }).toList();
                },
                onChanged: (val) {
                  onChange(val);
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
