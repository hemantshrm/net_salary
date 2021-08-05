import 'package:get/get.dart';

class CreateprofileController extends GetxController {
  //TODO: Implement CreateprofileController

  final count = 0.obs;

  final adopt=0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  onSelectSchemeAdoptOption(value){
    adopt.value=value;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
