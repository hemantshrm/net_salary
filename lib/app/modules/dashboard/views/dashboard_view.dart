import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:get/get.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_salary/app/data/ui_theme.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NetSalary',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(KDynamicWidth.width20),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/533/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ],
                ),
                SizedBox(
                  height: KDynamicWidth.width20,
                ),
                Text('Amithabh Singh',
                    style: KTextStyle.f18w5
                        .copyWith(color: Theme.of(context).primaryColorLight)),
                SizedBox(
                  height: 5,
                ),
                Text('CA, ICWA, LLB',
                    style: KTextStyle.f14w4
                        .copyWith(color: Theme.of(context).primaryColorLight)),
                SizedBox(
                  height: KDynamicWidth.width20 + KDynamicWidth.width20,
                ),
                buildDrawerOptions(
                    'assets/images/user.png', "Profile", context),
                SizedBox(
                  height: KDynamicWidth.width20,
                ),
                buildDrawerOptions(
                    'assets/images/feedback.png', "Feedback", context),
                SizedBox(
                  height: KDynamicWidth.width20,
                ),
                buildDrawerOptions(
                    'assets/images/help.png', "Contact Us", context),
                SizedBox(
                  height: KDynamicWidth.width20,
                ),
                buildDrawerOptions(
                    'assets/images/logout.png', "Logout", context),
                Spacer(),
                ValueBuilder<bool>(
                  initialValue: themeController.isDarkTheme,
                  builder: (value, updateFn) => Switch(
                      activeColor: themeController.theme.primaryColorDark,
                      value: value,
                      onChanged: (newValue) => (updateFn(newValue))),
                  onUpdate: (val) {
                    themeController.changeTheme(val);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'DashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Row buildDrawerOptions(icon, title, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
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
            padding: EdgeInsets.all(10),
            child: Image.asset(
              icon,
              fit: BoxFit.none,
              width: 20,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: KDynamicWidth.width20,
        ),
        Text(title,
            style: KTextStyle.f16w5
                .copyWith(color: Theme.of(context).primaryColorLight)),
      ],
    );
  }
}
