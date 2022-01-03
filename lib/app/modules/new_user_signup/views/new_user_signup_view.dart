import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';
import 'package:jethi_tech/app/services/auth.dart';

import '../controllers/new_user_signup_controller.dart';

class NewUserSignupView extends GetView<NewUserSignupController> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewUserSignupView'),
        centerTitle: true,
      ),
      body: Form(
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
            ),
            ElevatedButton(
                onPressed: () {
                  controller.onFormSumbit();
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
