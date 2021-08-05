import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/widgets/AppIcon.dart';
import 'package:net_salary/app/widgets/global_widgets.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(KDynamicWidth.width20),
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
              height: KDynamicWidth.width20,
            ),
            getEmailPassFields(context, 'Email Address', 'Enter Email', false),
            SizedBox(
              height: 30,
            ),
            getEmailPassFields(context, 'Password', 'Enter Password', true),
            SizedBox(
              height: 30,
            ),
            getEmailPassFields(
                context, 'Confirm Password', 'Enter Confirm Password', true),
            SizedBox(
              height: 20,
            ),
            GetButton('Sign Up', onTap: () {}),
            Padding(
              padding: EdgeInsets.symmetric(vertical: KDynamicWidth.width20),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
                  child: Text(
                    "Or Sign Up using",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
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
                  iconImageContainer(context, 'assets/images/google_icon.png'),
                  iconImageContainer(context, 'assets/images/apple_icon.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: KDynamicWidth.width20),
              child: Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: KDynamicWidth.width10),
                  child: Text(
                    "Or",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width / 6, vertical: Get.height / 30),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registered user?',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff1e2123),
                        letterSpacing: 0.672,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: KDynamicWidth.width10,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: const Color(0xff64a1ff),
                        letterSpacing: 0.672,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
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
