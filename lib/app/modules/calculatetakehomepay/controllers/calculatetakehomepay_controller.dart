import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class CalculatetakehomepayController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement CalculatetakehomepayController
  final _scrollController = ScrollController();
  final isKeyboardOpen=false.obs;
  final activeStep = 0.obs; // Initial step set to 5.

  final upperBound = 3.obs; // upperBound MUST BE total number of icons minus 1.

  final resdentialType = 0.obs;
  final resdentialIn = 0.obs;
  final childAllowance = 0.obs;
  final uniformAllowance = 0.obs;
  final transportAllowance = 0.obs;
  final houseRentAllowance = 0.obs;

  final numberofChildren = 0.obs;
  final numberofhostelgoingchildren = 0.obs;

  //=============================Perquisites=================================================//

  final vehicleRunningOptions = 0.obs;
  final ownedByEmployer = 0.obs;
  final MaintenancePaidBy = 0.obs;
  final chaufferProvidedBy = 0.obs;
  final natureOfVehicle = 0.obs;
  final cpacityOfCar = 0.obs;

  setvehicleRunningOptions(value) => vehicleRunningOptions.value = value;

  setownedByEmployer(value) => ownedByEmployer.value = value;

  setMaintenancePaidBy(value) => MaintenancePaidBy.value = value;

  setchaufferProvidedBy(value) => chaufferProvidedBy.value = value;

  setnatureOfVehicle(value) => natureOfVehicle.value = value;

  setcpacityOfCar(value) => cpacityOfCar.value = value;


  //========================perqisites second screen=============================================//


  final mealVoucher = 0.obs;
  final clubMembership = 0.obs;
  final furnitureAppliances = 0.obs;
  final charges = 0.obs;
  final leaveAssitance = 0.obs;
  final groupMedicalInsurance = 0.obs;
  final medicalInsurance = 0.obs;
  final keymanInsurance = 0.obs;

  setmealVoucher(value)=>mealVoucher.value=value;
  setclubMembership(value)=>clubMembership.value=value;
  setfurnitureAppliances(value)=>furnitureAppliances.value=value;
  setcharges(value)=>charges.value=value;
  setleaveAssitance(value)=>leaveAssitance.value=value;
  setgroupMedicalInsurance(value)=>groupMedicalInsurance.value=value;
  setmedicalInsurance(value)=>medicalInsurance.value=value;
  setkeymanInsurance(value)=>keymanInsurance.value=value;







  AssetImage stepperIconEnabled = AssetImage(
    'assets/images/stepper_icon.png',
  );
  AssetImage stepperIconDiabled = AssetImage(
    'assets/images/stepperU_icon.png',
  );
  List<ImageProvider<dynamic>> images = [];

  getContextMixing() {
    return this;
  }

  getScrollcontroller() {
    return _scrollController;
  }

  @override
  void onInit() {
    super.onInit();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        isKeyboardOpen.value=visible;
      },
    );

    for (int i = 0; i < 4; i++) {
      if (i == 0) {
        images.add(stepperIconEnabled);
      } else {
        images.add(stepperIconDiabled);
      }
    }
  }

  setNumberofChildren(value) {
    numberofChildren.value = value;
  }

  setNumberofhostelgoingChildren(value) {
    numberofhostelgoingchildren.value = value;
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () => extent_to_top());
  }

  @override
  void onClose() {}

  onresdentialChange(value) {
    resdentialType.value = value;
  }

  onresidentialInChange(value) {
    resdentialIn.value = value;
  }

  onChildrenEducationChange(value) {
    childAllowance.value = value;
  }

  onUnfiormChange(value) {
    uniformAllowance.value = value;
  }

  ontransportAllowanceChange(value) {
    transportAllowance.value = value;
  }

  onhouseRentAllowanceChange(value) {
    houseRentAllowance.value = value;
  }

  setStepperIndex(index) {
    activeStep.value = index;
  }

  increment() => activeStep.value++;

  decrement() => activeStep.value--;

  setImageindex(index) {
    for (int i = 0; i < images.length; i++) {
      if (i<=index) {
        images[i] = stepperIconEnabled;
      } else {
        images[i] = stepperIconDiabled;
      }
    }
  }

  extent_to_bottom() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  extent_to_top() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
