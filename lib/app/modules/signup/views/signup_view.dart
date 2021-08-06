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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
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
              height: KDynamicWidth.width20,
            ),
            getEmailPassFields(context, 'Password', 'Enter Password', true),
            SizedBox(
              height: KDynamicWidth.width20,
            ),
            getEmailPassFields(
                context, 'Confirm Password', 'Enter Confirm Password', true),
            SizedBox(
              height: KDynamicWidth.width20,
            ),
            GetButton('Sign Up', onTap: () {}),
            signInORsignUpUsing(context, 'Or Sign Up using'),
            buildSigninSignUpButtons(context),
            SizedBox(
              height: KDynamicWidth.width20,
            ),
            buildOr(context),
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
                    Text('Registered user?',
                        style: KTextStyle.f16w5.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 14)),
                    SizedBox(
                      width: KDynamicWidth.width10,
                    ),
                    Text('Sign In',
                        style: KTextStyle.f16w5.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 14)),
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
