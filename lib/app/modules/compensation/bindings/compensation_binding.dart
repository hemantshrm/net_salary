import 'package:get/get.dart';

import '../controllers/compensation_controller.dart';

class CompensationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompensationController>(
      () => CompensationController(),
    );
  }
}
