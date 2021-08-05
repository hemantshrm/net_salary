import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/routes/app_pages.dart';
import 'package:net_salary/app/widgets/global_widgets.dart';

import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: KColors.BG_LIGHT,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: KColors.BG_LIGHT,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(KDynamicWidth.width20),
                  color: KColors.BG_LIGHT,
                  child: ClayContainer(
                    height: Get.height / 2.4,
                    width: Get.width,
                    spread: 5,
                    borderRadius: 20,
                    color: Color(0xffDBECFC),
                    child: Container(
                      height: Get.height / 2.8,
                      width: Get.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(KDynamicWidth.width20),
                            child: Image.asset(
                              'assets/images/summary_icon.png',
                              height: Get.height / 6,
                              width: Get.width / .3,
                            ),
                          ),
                          _textWidget('Gross Salary(₹)', '4,000,00'),
                          _textWidget('Deductions(₹)', '2,000,00'),
                          _textWidget('Income Tax(₹)', '1,000,00'),
                          _textWidget('Net Take Home(₹)', '8,000,00'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetButton("Save and Continue", onTap: () {
                  Get.toNamed(Routes.DASHBOARD);
                }),
                Padding(
                  padding: EdgeInsets.all(KDynamicWidth.width20),
                  child: Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: const Color(0xff62A1FF),
                        letterSpacing: 0.672,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_textWidget(header, value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            color: Colors.black87,
          ),
        )
      ],
    ),
  );
}
