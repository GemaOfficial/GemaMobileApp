import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/authentication/register/service/reg_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final regService = RegService();
  GlobalKey<FormState> regFormKey = GlobalKey<FormState>();
  TextEditingController phoneCtrlr = TextEditingController();
  TextEditingController usernameCtrlr = TextEditingController();
  TextEditingController passCtrlr = TextEditingController();
  TextEditingController confirmPassCtrlr = TextEditingController();
  TextEditingController emailCtrlr = TextEditingController();

  var isPasswordObscure = true.obs;
  var isConfirmPasswordObscure = true.obs;
  var isLoginPasswdObscure = true.obs;

  var password = ''.obs;
  var confirmPassword = ''.obs;
  var displayText = 'Enter a password'.obs;

  var is8Characters = false.obs;
  var containsUpperCase = false.obs;
  var containsNumber = false.obs;
  var passwordsMatch = false.obs;
  var isSpecialChar = false.obs;

  RegExp numRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");
  RegExp upperCaseRegex = RegExp("/^[A-Z]*\$/");

  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
    isLoginPasswdObscure.value = !isLoginPasswdObscure.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  void passMatch(String value, String confirmPass) {
    if (value == confirmPass) {
      passwordsMatch.value = true;
    } else {
      passwordsMatch.value = false;
    }
  }

  void checkPasswordStregth(String value) {
    password.value = value.trim();
    if (password.value.length >= 8 &&
        RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password.value)) {
      is8Characters.value = true;
      containsNumber.value = true;
      containsUpperCase.value = true;
      isSpecialChar.value = true;
    } else if (password.value.length >= 8 &&
        !RegExp(r'^(?=.*?[A-Z]).{8,}$').hasMatch(password.value)) {
      is8Characters.value = true;
      containsNumber.value = false;
      containsUpperCase.value = true;
      isSpecialChar.value = false;
    } else if (password.value.length >= 8 &&
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password.value)) {
      is8Characters.value = true;
      containsNumber.value = false;
      containsUpperCase.value = true;
      isSpecialChar.value = false;
    } else if (password.value.isEmpty) {
      is8Characters.value = false;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password.value)) {
      containsNumber.value = false;
      containsUpperCase.value = false;
      passwordsMatch.value = false;
      isSpecialChar.value = false;
    }
  }

  Future<dynamic> registerUser() async {
    log("Phone0${phoneCtrlr.text}");
    Map<String, dynamic> regData = {
      'phone_number': "0${phoneCtrlr.text}",
      'password': passCtrlr.text,
      'confirm_password': confirmPassCtrlr.text,
      'username': usernameCtrlr.text,
      'email': emailCtrlr.text,
    };
    if (regFormKey.currentState!.validate()) {
      regFormKey.currentState?.save();
      return await regService.registerUser(regData);
    }
  }

  @override
  void onClose() {
    phoneCtrlr.dispose();
    usernameCtrlr.dispose();
    passCtrlr.dispose();
    confirmPassCtrlr.dispose();
    emailCtrlr.dispose();
    super.onClose();
  }
}
