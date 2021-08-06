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

class CalculatetakehomepayView extends StatelessWidget {
  final controller = Get.put(CalculatetakehomepayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Calculate Take Home Pay',
          style: KTextStyle.f16w5.copyWith(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.all(KDynamicWidth.width20),
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
            headerText(),
          ],
        ),
      ),
    );
  }
}

// /// Returns the next button.
// Widget nextButton() {
//   return ElevatedButton(
//     onPressed: () {
//       // Increment activeStep, when the next button is tapped. However, check for upper bound.
//       if (CalculatetakehomepayController.to.activeStep.value <
//           CalculatetakehomepayController.to.upperBound.value) {
//         CalculatetakehomepayController.to.increment();
//       }
//     },
//     child: Text('Next'),
//   );
// }
//
// /// Returns the previous button.
// Widget previousButton() {
//   return ElevatedButton(
//     onPressed: () {
//       // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
//       if (CalculatetakehomepayController.to.activeStep.value > 0) {
//         CalculatetakehomepayController.to.decrement();
//       }
//     },
//     child: Text('Prev'),
//   );
// }

_nextButton() {
  if (CalculatetakehomepayController.to.activeStep.value <
      CalculatetakehomepayController.to.upperBound.value) {
    CalculatetakehomepayController.to.increment();
    CalculatetakehomepayController.to
        .setImageindex(CalculatetakehomepayController.to.activeStep.value);
    new Future.delayed(const Duration(milliseconds: 100),
        () => CalculatetakehomepayController.to.extent_to_top());
  }
}

/// Returns the header wrapping the header text.

// Returns the header text based on the activeStep.
testWidget() {
  return Center(
    child: Text('ags ha'),
  );
}

headerText() {
  switch (CalculatetakehomepayController.to.activeStep.value) {
    case 0:
      return CompensationScreen();

    case 1:
      return AllowancesScreen();

    case 2:
      return PerqusitiesFirstScreen();

    case 3:
      return PerqusitiesSecondScreen();

    default:
      return testWidget();
  }
}

class AllowancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: Get.height * .65,
              child: Scrollbar(
                thickness: 7,
                radius: Radius.circular(5),
                controller:
                    CalculatetakehomepayController.to.getScrollcontroller(),
                isAlwaysShown: false,
                child: SingleChildScrollView(
                  reverse: true,
                  physics: ClampingScrollPhysics(),
                  controller:
                      CalculatetakehomepayController.to.getScrollcontroller(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: KDynamicWidth.width10),
                          child: Text('Allowances',
                              style: KTextStyle.f16w5.copyWith(
                                color: Theme.of(context).primaryColorLight,
                              ))),
                      SizedBox(
                        height: KDynamicWidth.width10,
                      ),
                      CustomRadioBtn(
                          'Residential Type',
                          CalculatetakehomepayController
                              .to.resdentialType.value,
                          'Owned',
                          'Rented', onchange: (value) {
                        CalculatetakehomepayController.to
                            .onresdentialChange(value);
                        Future.delayed(
                            const Duration(milliseconds: 500),
                            () => CalculatetakehomepayController.to
                                .extent_to_top());
                      }),
                      SizedBox(
                        height: KDynamicWidth.width20,
                      ),
                      AnimatedSizeAndFade(
                        vsync: CalculatetakehomepayController.to
                            .getContextMixing(),
                        child: CalculatetakehomepayController
                                    .to.resdentialType.value ==
                                1
                            ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    CustomRadioBtn(
                                        'Residential In',
                                        CalculatetakehomepayController
                                            .to.resdentialIn.value,
                                        'Metro',
                                        'Non-Metro', onchange: (value) {
                                      CalculatetakehomepayController.to
                                          .onresidentialInChange(value);
                                    }),
                                    SizedBox(
                                      height: KDynamicWidth.width20,
                                    ),
                                    GetEditTextWithoutIcon(
                                        "House Rent Allowance(₹)", 'Enter HRA',
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
                          'Children Education/Hostel Allowance',
                          CalculatetakehomepayController
                              .to.childAllowance.value,
                          'Yes',
                          'No', onchange: (value) {
                        CalculatetakehomepayController.to
                            .onChildrenEducationChange(value);
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedSizeAndFade(
                        vsync: CalculatetakehomepayController.to
                            .getContextMixing(),
                        child: CalculatetakehomepayController
                                    .to.childAllowance.value ==
                                0
                            ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    GetEditTextWithoutIconwithDropDown(
                                        "Number of Children",
                                        '',
                                        CalculatetakehomepayController
                                            .to.numberofChildren
                                            .toInt(), onChange: (value) {
                                      CalculatetakehomepayController.to
                                          .setNumberofChildren(value);
                                    }),
                                    SizedBox(
                                      height: KDynamicWidth.width20,
                                    ),
                                    GetEditTextWithoutIconwithDropDown(
                                        "Number of hostel going Children",
                                        '',
                                        CalculatetakehomepayController
                                            .to.numberofhostelgoingchildren
                                            .toInt(), onChange: (value) {
                                      CalculatetakehomepayController.to
                                          .setNumberofhostelgoingChildren(
                                              value);
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
                          CalculatetakehomepayController
                              .to.uniformAllowance.value,
                          'Yes',
                          'No', onchange: (value) {
                        CalculatetakehomepayController.to
                            .onUnfiormChange(value);
                      }),
                      SizedBox(
                        height: KDynamicWidth.width20,
                      ),
                      AnimatedSizeAndFade(
                        vsync: CalculatetakehomepayController.to
                            .getContextMixing(),
                        child: CalculatetakehomepayController
                                    .to.uniformAllowance.value ==
                                0
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: KDynamicWidth.width10),
                                child: Column(
                                  children: [
                                    getEditTextWithoutIconlongtext(
                                        context,
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
                          CalculatetakehomepayController
                              .to.transportAllowance.value,
                          'Yes',
                          'No', onchange: (value) {
                        CalculatetakehomepayController.to
                            .ontransportAllowanceChange(value);
                        Future.delayed(
                            const Duration(seconds: 2),
                            () => CalculatetakehomepayController.to
                                .extent_to_bottom());
                      }),
                      SizedBox(
                        height: KDynamicWidth.width20,
                      ),
                      AnimatedSizeAndFade(
                        vsync: CalculatetakehomepayController.to
                            .getContextMixing(),
                        child: CalculatetakehomepayController
                                    .to.transportAllowance.value ==
                                0
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: KDynamicWidth.width10,
                                    bottom: KDynamicWidth.width20),
                                child: GetEditTextWithoutIcon(
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
            Container(
              color: Colors.transparent,
              child: GetButton('Save and Continue', onTap: () {
                _nextButton();
              }),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class PerqusitiesFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              controller:
                  CalculatetakehomepayController.to.getScrollcontroller(),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                controller:
                    CalculatetakehomepayController.to.getScrollcontroller(),
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
                        CalculatetakehomepayController
                            .to.vehicleRunningOptions.value,
                        'Offical',
                        'Personal',
                        'Both', onChange: (value) {
                      CalculatetakehomepayController.to
                          .setvehicleRunningOptions(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn3optionsVertical(
                        'Ownership of Vehicle',
                        CalculatetakehomepayController.to.ownedByEmployer.value,
                        'Owned by Employer',
                        'Hired by Employer',
                        'Owned/Hired by Employee', onChange: (value) {
                      CalculatetakehomepayController.to
                          .setownedByEmployer(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Running &Maintenance paid by',
                        CalculatetakehomepayController
                            .to.MaintenancePaidBy.value,
                        'Employee',
                        'Employer', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setMaintenancePaidBy(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    GetEditTextWithoutIcon(
                        "Cost of Car(₹)", 'Enter Cost of Car',
                        isNum: true),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    GetEditTextWithoutIcon(
                        "Annual Hire Charges(₹)", 'Enter amount',
                        isNum: true),
                    SizedBox(
                      height: 20,
                    ),
                    CustomRadioBtn(
                        'Is Chauffeur Provided by Employer',
                        CalculatetakehomepayController
                            .to.chaufferProvidedBy.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setchaufferProvidedBy(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    GetEditTextWithoutIcon(
                        "Annual Salary of Chauffeur(₹)", 'Enter amount',
                        isNum: true),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Nature of Vehicle',
                        CalculatetakehomepayController.to.natureOfVehicle.value,
                        'Car',
                        'Other', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setnatureOfVehicle(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Cubic Capacity of Car',
                        CalculatetakehomepayController.to.cpacityOfCar.value,
                        'Upto 1.6 L',
                        '>1.6 L', onchange: (value) {
                      CalculatetakehomepayController.to.setcpacityOfCar(value);
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
}

class PerqusitiesSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              controller:
                  CalculatetakehomepayController.to.getScrollcontroller(),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                controller:
                    CalculatetakehomepayController.to.getScrollcontroller(),
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
                        CalculatetakehomepayController.to.mealVoucher.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to.setmealVoucher(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Club Membership',
                        CalculatetakehomepayController.to.clubMembership.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setclubMembership(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Furniture and Appliances',
                        CalculatetakehomepayController
                            .to.furnitureAppliances.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setfurnitureAppliances(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Home / Mobile Phone / Internet Charges',
                        CalculatetakehomepayController.to.charges.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to.setcharges(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Leave Travel Assistance (LTA / LTC)',
                        CalculatetakehomepayController.to.leaveAssitance.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setleaveAssitance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Group Medical Insurance',
                        CalculatetakehomepayController
                            .to.groupMedicalInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setgroupMedicalInsurance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Medical Reimbursement',
                        CalculatetakehomepayController
                            .to.medicalInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setmedicalInsurance(value);
                    }),
                    SizedBox(
                      height: KDynamicWidth.width20,
                    ),
                    CustomRadioBtn(
                        'Keyman Insurance',
                        CalculatetakehomepayController.to.keymanInsurance.value,
                        'Yes',
                        'No', onchange: (value) {
                      CalculatetakehomepayController.to
                          .setkeymanInsurance(value);
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

class CompensationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height / 1.4,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: KDynamicWidth.width10),
                      child: Text('Compensation',
                          style: KTextStyle.f16w5.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ))),
                  SizedBox(
                    height: KDynamicWidth.width10,
                  ),
                  GetEditTextWithoutIcon(
                      "Basic Salary(₹)", 'Enter Basic Salary',
                      isNum: true),
                  SizedBox(
                    height: KDynamicWidth.width20,
                  ),
                  GetEditTextWithoutIcon(
                      "Dearness Allowance(₹)", 'Enter Dearness Allowance',
                      isNum: true),
                  SizedBox(
                    height: KDynamicWidth.width20,
                  ),
                  GetEditTextWithoutIcon(
                      "Performance Incentive / Bonus(₹)", 'Enter Bonus',
                      isNum: true),
                  SizedBox(
                    height: KDynamicWidth.width20,
                  ),
                  GetEditTextWithoutIcon(
                      "Special Allowance(₹)", 'Enter Special Allowance',
                      isNum: true),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 8,
            ),
            !CalculatetakehomepayController.to.isKeyboardOpen.value
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
}

class CustomRadioBtn extends StatelessWidget {
  CustomRadioBtn(this.heading, this._radioValue1, this.text1, this.text2,
      {this.onchange});
  final _radioValue1;
  final String heading, text1, text2;
  final Function onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: CustomNmorphicForTextFields(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, left: KDynamicWidth.width20),
                child: Container(
                  height: 22,
                  child: Text('$heading',
                      style: KTextStyle.f16w5.copyWith(
                          fontSize: 15,
                          color: Theme.of(context).primaryColorLight)),
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
                                activeColor:
                                    Theme.of(context).primaryColorLight,
                                value: 0,
                                groupValue: _radioValue1,
                                onChanged: (value) {
                                  onchange(0);
                                },
                              ),
                            ),
                            new AutoSizeText(text1,
                                style: KTextStyle.f16w5.copyWith(
                                    fontSize: 15,
                                    color:
                                        Theme.of(context).primaryColorLight)),
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
                                activeColor:
                                    Theme.of(context).primaryColorLight,
                                value: 1,
                                groupValue: _radioValue1,
                                onChanged: (value) {
                                  onchange(1);
                                },
                              ),
                            ),
                            new Text(text2,
                                style: KTextStyle.f16w5.copyWith(
                                    fontSize: 15,
                                    color:
                                        Theme.of(context).primaryColorLight)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          17),
    );
  }
}
