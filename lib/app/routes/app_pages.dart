import 'package:get/get.dart';

import 'package:net_salary/app/modules/calculatetakehomepay/bindings/calculatetakehomepay_binding.dart';
import 'package:net_salary/app/modules/calculatetakehomepay/views/calculatetakehomepay_view.dart';

import 'package:net_salary/app/modules/createprofile/bindings/createprofile_binding.dart';
import 'package:net_salary/app/modules/createprofile/views/createprofile_view.dart';
import 'package:net_salary/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:net_salary/app/modules/dashboard/views/dashboard_view.dart';
import 'package:net_salary/app/modules/home/bindings/home_binding.dart';
import 'package:net_salary/app/modules/home/views/home_view.dart';
import 'package:net_salary/app/modules/intro_screen/bindings/intro_screen_binding.dart';
import 'package:net_salary/app/modules/intro_screen/views/intro_screen_view.dart';
import 'package:net_salary/app/modules/signup/bindings/signup_binding.dart';
import 'package:net_salary/app/modules/signup/views/signup_view.dart';
import 'package:net_salary/app/modules/summary/bindings/summary_binding.dart';
import 'package:net_salary/app/modules/summary/views/summary_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CREATEPROFILE,
      page: () => CreateProfileView(),
      binding: CreateprofileBinding(),
    ),
    GetPage(
      name: _Paths.CALCULATETAKEHOMEPAY,
      page: () => CalculatetakehomepayView(),
      binding: CalculatetakehomepayBinding(),
    ),
    GetPage(
      name: _Paths.SUMMARY,
      page: () => SummaryView(),
      binding: SummaryBinding(),
    ),
    GetPage(
      name: _Paths.INTRO_SCREEN,
      page: () => IntroScreenView(),
      binding: IntroScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
