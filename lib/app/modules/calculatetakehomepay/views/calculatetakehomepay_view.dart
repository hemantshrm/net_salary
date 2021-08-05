import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:net_salary/app/Constants/AppConstants.dart';
import 'package:net_salary/app/modules/createprofile/views/createprofile_view.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/modules/summary/views/summary_view.dart';
import 'package:net_salary/app/widgets/global_widgets.dart';

import '../controllers/calculatetakehomepay_controller.dart';

class CalculatetakehomepayView extends GetView<CalculatetakehomepayController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculatetakehomepayController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Calculate Take Home Pay',
          // style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        // backgroundColor: KColors.APP_BG_LIGHT,
        // centerTitle: true,
        // leading: BackButton(color: Colors.black),
      ),
      body: Container(
        color: KColors.BG_LIGHT,
        height: Get.height,
        width: Get.width,
        child: Obx(
          () => Column(
            children: [
              ImageStepper(
                enableNextPreviousButtons: false,
                stepColor: Colors.transparent,
                activeStepBorderColor: Colors.transparent,
                stepPadding: 0,
                lineLength: 20,
                stepRadius: 35,
                activeStepBorderPadding: 0,
                activeStepBorderWidth: 0,

                images: controller.images,

                // activeStep property set to activeStep variable defined above.
                activeStep: controller.activeStep.value,

                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  controller.setImageindex(index);
                  controller.setStepperIndex(index);
                  new Future.delayed(const Duration(milliseconds: 100),
                      () => controller.extent_to_top());
                },
              ),
              Expanded(
                child: headerText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (controller.activeStep.value < controller.upperBound.value) {
          controller.increment();
        }
      },
      child: Text('Next'),
    );
  }

  _nextButton() {
    if (controller.activeStep.value < controller.upperBound.value) {
      controller.increment();
      controller.setImageindex(controller.activeStep.value);
      new Future.delayed(
          const Duration(milliseconds: 100), () => controller.extent_to_top());
    }
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (controller.activeStep.value > 0) {
          controller.decrement();
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.

  // Returns the header text based on the activeStep.
  testWidget() {
    return Center(
      child: Text('ags ha'),
    );
  }

  headerText() {
    switch (controller.activeStep.value) {
      case 0:
        return compensationScreen();

      case 1:
        return Allowances_Screen();

      case 2:
        return PerqusitiesFirstScreen();

      case 3:
        return perqusitiesSecondScreen();

      default:
        return testWidget();
    }
  }

  compensationScreen() {
    return SingleChildScrollView(
      child: Container(
        height: Get.height / 1.4,
        width: Get.width,
        // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: KDynamicWidth.width20,
                          vertical: KDynamicWidth.width10),
                      child: Text(
                        'Compensation',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  getEditTextWithoutIcon(
                      "Basic Salary(₹)", 'Enter Basic Salary',
                      isNum: true),
                  SizedBox(
                    height: 20,
                  ),
                  getEditTextWithoutIcon(
                      "Dearness Allowance(₹)", 'Enter Dearness Allowance',
                      isNum: true),
                  SizedBox(
                    height: 20,
                  ),
                  getEditTextWithoutIcon(
                      "Performance Incentive / Bonus(₹)", 'Enter Bonus',
                      isNum: true),
                  SizedBox(
                    height: 20,
                  ),
                  getEditTextWithoutIcon(
                      "Special Allowance(₹)", 'Enter Special Allowance',
                      isNum: true),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 8,
            ),
            !controller.isKeyboardOpen.value
                ? Container(
                    child: GetButton('Save and Continue', onTap: () {
                      _nextButton();
                    }),
                  )
                : SizedBox(),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  Allowances_Screen() {
    return Container(
      height: Get.height,
      width: Get.width,

      // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        children: [
          Container(
            height: Get.height * .65,
            width: Get.width,
            child: Scrollbar(
              thickness: 10,
              radius: Radius.circular(5),
              controller: controller.getScrollcontroller(),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                controller: controller.getScrollcontroller(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: KDynamicWidth.width20,
                            vertical: KDynamicWidth.width10),
                        child: Text(
                          'Allowances',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRadioBtn(
                        'Residential Type',
                        controller.resdentialType.value,
                        'Owned',
                        'Rented', onchange: (value) {
                      controller.onresdentialChange(value);
                      Future.delayed(const Duration(milliseconds: 500),
                          () => controller.extent_to_top());
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedSizeAndFade(
                      vsync: controller.getContextMixing(),
                      child: controller.resdentialType.value == 1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  CustomRadioBtn(
                                      'Residential In',
                                      controller.resdentialIn.value,
                                      'Metro',
                                      'Non-Metro', onchange: (value) {
                                    controller.onresidentialInChange(value);
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  getEditTextWithoutIcon(
                                      "House Rent Allowance(₹)", 'Enter HRA',
                                      isNum: true),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                    CustomRadioBtn(
                        'Children Education/Hostel Allowance',
                        controller.childAllowance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.onChildrenEducationChange(value);
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedSizeAndFade(
                      vsync: controller.getContextMixing(),
                      child: controller.childAllowance.value == 0
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  getEditTextWithoutIconwithDropDown(
                                      "Number of Children",
                                      '',
                                      controller.numberofChildren.toInt(),
                                      onChange: (value) {
                                    controller.setNumberofChildren(value);
                                  }),
                                  SizedBox(
                                    height: KDynamicWidth.width20,
                                  ),
                                  getEditTextWithoutIconwithDropDown(
                                      "Number of hostel going Children",
                                      '',
                                      controller.numberofhostelgoingchildren
                                          .toInt(), onChange: (value) {
                                    controller
                                        .setNumberofhostelgoingChildren(value);
                                  }),
                                  SizedBox(
                                    height: KDynamicWidth.width20,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                    CustomRadioBtn(
                        'Uniform Allowance',
                        controller.uniformAllowance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.onUnfiormChange(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    AnimatedSizeAndFade(
                      vsync: controller.getContextMixing(),
                      child: controller.uniformAllowance.value == 0
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: KDynamicWidth.width10),
                              child: Column(
                                children: [
                                  getEditTextWithoutIconlongtext(
                                      "Amount you will be able to spend on uniform /n and its maintenance(₹)",
                                      'Enter Amount',
                                      isNum: true),
                                  SizedBox(
                                    height: KDynamicWidth.width20,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                    CustomRadioBtn(
                        'Transport Allowance',
                        controller.transportAllowance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.ontransportAllowanceChange(value);
                      Future.delayed(const Duration(seconds: 2),
                          () => controller.extent_to_bottom());
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    AnimatedSizeAndFade(
                      vsync: controller.getContextMixing(),
                      child: controller.transportAllowance.value == 0
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: KDynamicWidth.width10,
                                  bottom: KDynamicWidth.width20),
                              child: getEditTextWithoutIcon(
                                  "Transport Allowance(₹)",
                                  'Enter Transport Allowance',
                                  isNum: true),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.transparent,
                child: GetButton('Save and Continue', onTap: () {
                  _nextButton();
                }),
              ))
        ],
      ),
    );
  }

  PerqusitiesFirstScreen() {
    return Container(
      height: Get.height,
      width: Get.width,

      // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        children: [
          Container(
            height: Get.height * .65,
            width: Get.width,
            child: Scrollbar(
              thickness: 10,
              radius: Radius.circular(5),
              controller: controller.getScrollcontroller(),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                controller: controller.getScrollcontroller(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 30, vertical: KDynamicWidth.width10),
                        child: Text(
                          'Perquisites',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        )),
                    SizedBox(
                      height: KDynamicWidth.width10,
                    ),
                    getEditTextWithoutIconwithLongText(
                      'Company Leased Accomodation',
                      'For the movement, we will assume it is a company leased unfurnished accommodation and proceed to calculate tax accordingly.',
                    ),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn3options(
                        'Vehicle / Running & Maintenance / Chauffeur',
                        controller.vehicleRunningOptions.value,
                        'Offical',
                        'Personal',
                        'Both', onChange: (value) {
                      controller.setvehicleRunningOptions(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn3optionsVertical(
                        'Ownership of Vehicle',
                        controller.ownedByEmployer.value,
                        'Owned by Employer',
                        'Hired by Employer',
                        'Owned/Hired by Employee', onChange: (value) {
                      controller.setownedByEmployer(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Running &Maintenance paid by',
                        controller.MaintenancePaidBy.value,
                        'Employee',
                        'Employer', onchange: (value) {
                      controller.setMaintenancePaidBy(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    getEditTextWithoutIcon(
                        "Cost of Car(₹)", 'Enter Cost of Car',
                        isNum: true),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    getEditTextWithoutIcon(
                        "Annual Hire Charges(₹)", 'Enter amount',
                        isNum: true),
                    SizedBox(
                      height: 20,
                    ),
                    CustomRadioBtn(
                        'Is Chauffeur Provided by Employer',
                        controller.chaufferProvidedBy.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setchaufferProvidedBy(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    getEditTextWithoutIcon(
                        "Annual Salary of Chauffeur(₹)", 'Enter amount',
                        isNum: true),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Nature of Vehicle',
                        controller.natureOfVehicle.value,
                        'Car',
                        'Other', onchange: (value) {
                      controller.setnatureOfVehicle(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Cubic Capacity of Car',
                        controller.cpacityOfCar.value,
                        'Upto 1.6 L',
                        '>1.6 L', onchange: (value) {
                      controller.setcpacityOfCar(value);
                    }),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.transparent,
                child: GetButton('Save and Continue', onTap: () {
                  _nextButton();
                }),
              ))
        ],
      ),
    );
  }

  perqusitiesSecondScreen() {
    return Container(
      height: Get.height,
      width: Get.width,

      // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        children: [
          Container(
            height: Get.height * .65,
            width: Get.width,
            child: Scrollbar(
              thickness: 10,
              radius: Radius.circular(5),
              controller: controller.getScrollcontroller(),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                controller: controller.getScrollcontroller(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'Perquisites',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        )),
                    SizedBox(
                      height: KDynamicWidth.width10,
                    ),
                    CustomRadioBtn(
                        'Meal Vouchers',
                        controller.mealVoucher.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setmealVoucher(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Club Membership',
                        controller.clubMembership.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setclubMembership(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Furniture and Appliances',
                        controller.furnitureAppliances.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setfurnitureAppliances(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Home / Mobile Phone / Internet Charges',
                        controller.charges.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setcharges(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Leave Travel Assistance (LTA / LTC)',
                        controller.leaveAssitance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setleaveAssitance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Group Medical Insurance',
                        controller.groupMedicalInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setgroupMedicalInsurance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Medical Reimbursement',
                        controller.medicalInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setmedicalInsurance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Keyman Insurance',
                        controller.keymanInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      controller.setkeymanInsurance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.transparent,
                child: GetButton('Save and Continue', onTap: () {
                  Get.to(() => SummaryView());
                }),
              ))
        ],
      ),
    );
  }
}

CustomRadioBtn(String heading, _radioValue1, text1, text2,
    {Function(int) onchange}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: KDynamicWidth.width20),
    child: FittedBox(
      child: ClayContainer(
        height: 100,
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
            Container(
              padding: EdgeInsets.only(left: KDynamicWidth.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      onchange(0);
                    },
                    child: Container(
                      width: Get.width / 2.7,
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                              value: 0,
                              groupValue: _radioValue1,
                              onChanged: (value) {
                                onchange(0);
                              },
                            ),
                          ),
                          new AutoSizeText(
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
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      onchange(1);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                              value: 1,
                              groupValue: _radioValue1,
                              onChanged: (value) {
                                onchange(1);
                              },
                            ),
                          ),
                          new Text(
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
