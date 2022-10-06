import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/authentication/reset/services/forgot_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ForgotController extends GetxController {
  final forgotService = ForgotService();

  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

  TextEditingController emailCtrlr = TextEditingController();

  Future<dynamic> forgotPassword() async {
    log('forgotPassword ::: + ${emailCtrlr.text}');
    Map<String, dynamic> forgotData = {
      'email': emailCtrlr.text.trim(),
    };
    if (forgotFormKey.currentState!.validate()) {
      forgotFormKey.currentState?.save();
      return await forgotService.forgotPassword(forgotData);
    }
  }

  @override
  void onClose() {
    emailCtrlr.dispose();
    super.onClose();
  }
}

class ResetController extends GetxController {
  final forgotService = ForgotService();

  final box = GetStorage();
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();

  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController newPassConfirmCtrl = TextEditingController();
  TextEditingController resetCodeCtrl = TextEditingController();
  String? resetCode = '';

  Future<dynamic> forgotPassword() async {
    Map<String, dynamic> forgotData = {
      'password': newPassConfirmCtrl.text,
      'confirm_password': newPassConfirmCtrl.text,
      'reset_code': resetCode!,
    };
    if (resetPassFormKey.currentState!.validate()) {
      resetPassFormKey.currentState?.save();
      return await forgotService.resetPassword(forgotData);
    }
  }

  @override
  void onInit() {
    resetCode = box.read("reset_code");
    resetCodeCtrl.text = resetCode!;

    log(resetCode ?? 'no code');
    super.onInit();
  }

  @override
  void onClose() {
    newPassConfirmCtrl.dispose();
    newPassCtrl.dispose();
    resetCodeCtrl.dispose();
    super.onClose();
  }
}
