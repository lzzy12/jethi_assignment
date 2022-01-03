import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';

class NewUserSignupController extends GetxController {
  late TextEditingController ageController;

  final gender = Rx<Gender?>(null);
  final age = Rx<int?>(null);
  late GlobalKey<FormState> formKey;
  @override
  void onInit() {
    super.onInit();
    ageController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void onGenderChanged(Gender? gender) {
    this.gender.value = gender;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Age is required!";
    }
    if (value.isNumericOnly) return null;
    return "Please enter a valid age";
  }

  String? genderValidator(Gender? gender) {
    return gender == null ? "Please select a gender" : null;
  }

  void onSaveAge(String? age) {
    debugPrint("called OnSaveAge");
    this.age.value = int.parse(ageController.text);
  }

  void onSaveGender(Gender? gender) {
    this.gender.value = gender;
  }

  void onFormSumbit() {
    final form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) return;
    form.save();
  }
}
