import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/ui_theme.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init(); // for get storage
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final _controller = Get.put(ThemeController(), permanent: true);

  runApp(
    SimpleBuilder(
      builder: (_) => GetMaterialApp(
        title: "NetSalary",
        theme: _controller.theme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
