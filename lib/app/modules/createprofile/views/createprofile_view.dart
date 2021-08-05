import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/modules/calculatetakehomepay/views/calculatetakehomepay_view.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/routes/app_pages.dart';
import 'package:net_salary/app/widgets/global_widgets.dart';

import '../controllers/createprofile_controller.dart';

class CreateProfileView extends GetView<CreateprofileController> {
  final controller = Get.put(CreateprofileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Create Profile',
          style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(KDynamicWidth.width20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: KDynamicWidth.width20),
              child: GetEditTextWithoutIcon('Name', 'Enter Name',
                  isNum: null, ontextChange: (String) {}),
            ),
            Container(
              margin: EdgeInsets.only(top: KDynamicWidth.width20),
              child: GetEditTextWithoutIcon('Age', 'Enter Age', isNum: true),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: KDynamicWidth.width20),
                child: CustomRadioBtn3options(
                    'Adopt revised scheme of taxation?',
                    controller.adopt.value,
                    'Yes',
                    'No',
                    'Show me both', onChange: (val) {
                  controller.onSelectSchemeAdoptOption(val);
                }),
              ),
            ),
            Spacer(),
            GetButton("Save and Continue", onTap: () {
              Get.toNamed(Routes.CALCULATETAKEHOMEPAY);
            }),
            Padding(
                padding: EdgeInsets.all(KDynamicWidth.width20),
                child: Center(
                  child: Text('Exit',
                      style: KTextStyle.f16w5
                          .copyWith(color: Theme.of(context).primaryColor)),
                ))
          ],
        ),
      ),
    );
  }
}

CustomRadioBtn3optionsVertical(
    String heading, _radioValue1, text1, text2, text3,
    {onChange(value)}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
    child: FittedBox(
      child: ClayContainer(
        height: 200,
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
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: KDynamicWidth.width10),
              child: Column(
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
                              value: 0,
                              groupValue: _radioValue1,
                              onChanged: (val) {
                                onChange(val);
                              }),
                        ),
                        Text(
                          text1,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff2c2c2c),
                            letterSpacing: 0.5760000000000001,
                          ),
                        ),
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
                              value: 1,
                              groupValue: _radioValue1,
                              onChanged: (val) {
                                onChange(val);
                              }),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff2c2c2c),
                            letterSpacing: 0.5760000000000001,
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
                              value: 2,
                              groupValue: _radioValue1,
                              onChanged: (val) {
                                onChange(val);
                              }),
                        ),
                        Text(
                          text3,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff2c2c2c),
                            letterSpacing: 0.5760000000000001,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
