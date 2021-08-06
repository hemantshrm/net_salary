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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
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
            signInORsignUpUsing(context, 'Or Sign in using'),
            buildSigninSignUpButtons(context),
            SizedBox(height: KDynamicWidth.width20),
            buildOr(context),
            SizedBox(height: KDynamicWidth.width20),
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

getEmailPassFields(
    BuildContext context, String heading, String hint, bool isIcon) {
  return Container(
    height: Get.width / 5.5,
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                heading,
                style: KTextStyle.f15w4
                    .copyWith(color: Theme.of(context).primaryColorLight),
              ),
            ),
            Container(
              height: 35,
              child: TextField(
                style: KTextStyle.f15w4
                    .copyWith(color: Theme.of(context).primaryColorLight),
                maxLength: 30,
                decoration: InputDecoration(
                    counterText: '',
                    // labelText: heading,
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
                            color: Theme.of(context).focusColor,
                          )
                        : null),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

getEditTextWithoutIconlongtext(
    BuildContext context, String heading, String hint,
    {bool isNum}) {
  return Container(
    height: 90,
    child: CustomNmorphicForTextFields(
        Column(
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
                  style: KTextStyle.f16w5
                      .copyWith(color: Theme.of(context).primaryColorLight),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: KDynamicWidth.width20),
              child: Container(
                height: 30,
                child: TextField(
                  style: KTextStyle.f16w5
                      .copyWith(color: Theme.of(context).primaryColorLight),
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
        17),
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

class GetEditTextWithoutIconwithDropDown extends StatelessWidget {
  GetEditTextWithoutIconwithDropDown(
      this.heading, this.hint, this._dropDownValue,
      {this.onChange});
  final String heading, hint;

  final Function onChange;
  final _dropDownValue;
  @override
  Widget build(BuildContext context) {
    final List<int> items = <int>[0, 1, 2];
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
      child: CustomNmorphicForTextFields(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
                child: Container(
                    height: 25,
                    child: Text('$heading',
                        style: KTextStyle.f16w5
                            .copyWith(color: Theme.of(context).focusColor))),
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
                        child: Text(item.toString(),
                            textAlign: TextAlign.end,
                            style: KTextStyle.f16w5
                                .copyWith(color: Theme.of(context).focusColor)),
                      );
                    }).toList();
                  },
                  onChanged: (val) {
                    onChange(val);
                  },
                ),
              ),
            ],
          ),
          17),
    );
  }
}
