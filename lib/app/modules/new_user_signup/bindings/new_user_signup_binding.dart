import 'package:get/get.dart';

import '../controllers/new_user_signup_controller.dart';

class NewUserSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewUserSignupController>(
      () => NewUserSignupController(),
    );
  }
}
