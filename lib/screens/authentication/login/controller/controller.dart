import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/authentication/login/service/login_service.dart';
import 'package:get/get.dart';

// BUG: Duplicate GlobalKey detected in widget tree.

class LoginController extends GetxController {
  final loginService = LoginService();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController phoneCtrlr = TextEditingController();
  TextEditingController passCtrlr = TextEditingController();

  var isPasswdObscure = true.obs;

  Future<dynamic> loginUser() async {
    Map<String, dynamic> loginData = {
      'phone_number': "+254${phoneCtrlr.text}",
      'password': passCtrlr.text,
    };
    
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState?.save();
      return await loginService.loginUser(loginData);
    }
  }

  void togglePasswordVisibility() {
    isPasswdObscure.value = !isPasswdObscure.value;
  }

  @override
  void onClose() {
    phoneCtrlr.dispose();
    passCtrlr.dispose();
    super.onClose();
  }
}
