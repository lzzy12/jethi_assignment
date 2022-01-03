import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';
import 'package:jethi_tech/app/routes/app_pages.dart';
import 'package:jethi_tech/app/services/auth.dart';

import '../controllers/new_user_signup_controller.dart';

class NewUserSignupView extends GetView<NewUserSignupController> {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(auth.currentUser?.name ?? ""),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.ageController,
                decoration:
                    const InputDecoration(label: Text("Age"), hintText: "20"),
                keyboardType: TextInputType.number,
                validator: controller.ageValidator,
                onSaved: controller.onSaveAge,
              ),
              DropdownButtonFormField<Gender>(
                hint: const Text("Select Age"),
                items: const <DropdownMenuItem<Gender>>[
                  DropdownMenuItem(
                    child: Text("Male"),
                    value: Gender.male,
                  ),
                  DropdownMenuItem(
                    child: Text("Female"),
                    value: Gender.female,
                  ),
                  DropdownMenuItem(
                    child: Text("Others"),
                    value: Gender.others,
                  ),
                ],
                validator: controller.genderValidator,
                onSaved: controller.onSaveGender,
                onChanged: controller.onGenderChanged,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.onFormSumbit();
                    final User? user = auth.currentUser;
                    if (user == null) return;
                    user.age = controller.age.value;
                    user.gender = controller.gender.value;
                    auth.saveAdditionalUserData(user);
                    Get.back();
                    Get.toNamed(Routes.USER_DETAILS);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
