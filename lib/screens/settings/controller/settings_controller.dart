import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/settings/service/settings_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _service = SettingService();
  final storage = GetStorage();
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  TextEditingController currPasswdCtrlr = TextEditingController();
  TextEditingController newPasswdCtrlr = TextEditingController();
  TextEditingController confirmPasswdCtrlr = TextEditingController();

  var settingsIndex = 0.obs;

  var isCurrObscure = true.obs;
  var isNewObscure = true.obs;
  var isConfirmObscure = true.obs;

  setSettingsIndex(int index) {
    settingsIndex.value = index;
    update();
  }

  resetSettings() {
    settingsIndex.value = 0;
    update();
  }

  void toggleCurrent() {
    isCurrObscure.value = !isCurrObscure.value;
  }

  void toggleNew() {
    isNewObscure.value = !isNewObscure.value;
  }

  void toggleConfirm() {
    isConfirmObscure.value = !isConfirmObscure.value;
  }

  Future<dynamic> updateProfile() async {
    Map<String, dynamic> profileData = {
      'current_password': currPasswdCtrlr.text,
      'new_password': newPasswdCtrlr.text,
      'confirm_password': confirmPasswdCtrlr.text,
    };
    if (profileFormKey.currentState!.validate()) {
      profileFormKey.currentState?.save();
      return await _service.updateProfile(profileData);
    }
  }
}
