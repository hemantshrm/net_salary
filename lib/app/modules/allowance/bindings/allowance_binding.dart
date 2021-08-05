import 'package:get/get.dart';

import '../controllers/allowance_controller.dart';

class AllowanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllowanceController>(
      () => AllowanceController(),
    );
  }
}
