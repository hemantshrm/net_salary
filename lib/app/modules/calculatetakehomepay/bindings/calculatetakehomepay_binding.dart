import 'package:get/get.dart';

import '../controllers/calculatetakehomepay_controller.dart';

class CalculatetakehomepayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatetakehomepayController>(
      () => CalculatetakehomepayController(),
    );
  }
}
