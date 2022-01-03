import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jethi_tech/app/data/user.dart';

class NewUserSignupController extends GetxController {
  late TextEditingController ageController;

  final gender = Rx<Gender?>(null);
  final age = Rx<int?>(null);
  late GlobalKey<FormState> _formState;
  @override
  void onReady() {
    super.onReady();
    ageController = TextEditingController();
    _formState = GlobalKey<FormState>();
  }

  String? ageValidator(String? value) {
    if (value == null) {
      return "Age is required!";
    }
    final regex = RegExp(r'^[0-9]*$');
    if (regex.hasMatch(value)) return null;
    return "Please enter a valid age";
  }

  String? genderValidator(Gender? gender) {
    return gender == null ? "Please select a gender" : null;
  }

  void onSaveAge(String? age) {
    this.age.value = int.parse(ageController.text);
  }

  void onSaveGender(Gender? gender) {
    this.gender.value = gender;
  }

  void onFormSumbit() {
    final form = _formState.currentState;
    if (form == null) return;
    if (!form.validate()) return;
    form.save();
  }
}
