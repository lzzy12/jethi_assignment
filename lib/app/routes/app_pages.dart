import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_user_signup/bindings/new_user_signup_binding.dart';
import '../modules/new_user_signup/views/new_user_signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NEW_USER_SIGNUP,
      page: () => NewUserSignupView(),
      binding: NewUserSignupBinding(),
    ),
  ];
}
