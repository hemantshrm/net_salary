import 'package:clay_containers/widgets/clay_container.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CustomNmorphicForTextFields extends StatelessWidget {
  final Widget child;
  final double shapeRadius;
  CustomNmorphicForTextFields(this.child, this.shapeRadius);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape:
              NeumorphicBoxShape.roundRect(BorderRadius.circular(shapeRadius)),
          depth: 6,
          lightSource: LightSource.topLeft,
          shadowLightColor: ThemeController.to.isDarkTheme
              ? Colors.white.withOpacity(0.4)
              : Colors.white,
          shadowDarkColor:
              ThemeController.to.isDarkTheme ? Colors.black : Colors.black54,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: child);
  }
}

class GetEditTextWithoutIcon extends StatelessWidget {
  GetEditTextWithoutIcon(this.heading, this.hint,
      {this.isNum, this.ontextChange(String)});

  final String heading, hint;
  final bool isNum;
  final Function ontextChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 6,
      child: CustomNmorphicForTextFields(
          Padding(
            padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
            child: TextFormField(
                keyboardType:
                    isNum != null ? TextInputType.number : TextInputType.text,
                maxLength: isNum != null ? 11 : 30,
                cursorColor: Colors.grey,
                textInputAction: TextInputAction.unspecified,
                maxLines: 1,
                onChanged: (text) {
                  ontextChange(text);
                },
                inputFormatters: [
                  isNum != null
                      ? CurrencyTextInputFormatter(
                          locale: 'Hi',
                          decimalDigits: 0,
                          symbol: '',
                        )
                      : FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                ],
                autofocus: false,
                style: KTextStyle.f15w4.copyWith(
                    color: Theme.of(context).primaryColorLight, fontSize: 16),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: heading,
                  labelStyle: KTextStyle.f15w4.copyWith(
                      color: Theme.of(context).primaryColorLight, fontSize: 16),
                  counterText: '',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 2,
                  ),
                  focusedBorder: InputBorder.none,
                  hintStyle: KTextStyle.f15w4
                      .copyWith(color: Theme.of(context).primaryColorLight),
                )),
          ),
          17),
    );
  }
}

class CustomRadioBtn3options extends StatelessWidget {
  CustomRadioBtn3options(
      this.heading, this._radioValue1, this.text1, this.text2, this.text3,
      {this.onChange});
  final String heading, text1, text2, text3;
  final _radioValue1;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.width / 3,
        child: CustomNmorphicForTextFields(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 4,
                  ),
                  child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '$heading',
                        style: KTextStyle.f15w4.copyWith(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        onChange(0);
                      },
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                                activeColor: Theme.of(context).focusColor,
                                value: 0,
                                groupValue: _radioValue1,
                                onChanged: (val) {
                                  onChange(val);
                                }),
                          ),
                          Text(
                            text1,
                            style: KTextStyle.f15w4.copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onChange(1);
                      },
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                                activeColor: Theme.of(context).focusColor,
                                value: 1,
                                groupValue: _radioValue1,
                                onChanged: (val) {
                                  onChange(val);
                                }),
                          ),
                          Text(
                            text2,
                            style: KTextStyle.f15w4.copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onChange(2);
                      },
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                                activeColor: Theme.of(context).focusColor,
                                value: 2,
                                groupValue: _radioValue1,
                                onChanged: (val) {
                                  onChange(val);
                                }),
                          ),
                          Text(
                            text3,
                            style: KTextStyle.f15w4.copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            17));
  }
}

Padding signInORsignUpUsing(BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: KDynamicWidth.width20,
    ),
    child: Row(children: <Widget>[
      Expanded(child: Divider()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).primaryColorLight),
        ),
      ),
      Expanded(child: Divider()),
    ]),
  );
}

Container buildSigninSignUpButtons(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: Get.width / 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconImageContainer(context, 'assets/images/facebook_icon.png'),
        iconImageContainer(context, 'assets/images/google.png'),
        iconImageContainer(
            context,
            ThemeController.to.isDarkTheme
                ? 'assets/images/apple_dark.png'
                : 'assets/images/apple_icon.png'),
      ],
    ),
  );
}

Row buildOr(BuildContext context) {
  return Row(children: <Widget>[
    Expanded(child: Divider()),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
      child: Text(
        "Or",
        style:
            TextStyle(fontSize: 16, color: Theme.of(context).primaryColorLight),
      ),
    ),
    Expanded(child: Divider()),
  ]);
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
