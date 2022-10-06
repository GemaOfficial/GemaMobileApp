import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ForgotService {
  final box = GetStorage();
  Future<dynamic> forgotPassword(Map<String, dynamic> forgotData) async {
    var headers = {'Content-Type': 'application/json'};
    EasyLoading.show(status: 'Reqesting code...');
    try {
      var res = await http.post(
        headers: headers,
        Uri.parse('$baseUrl/api/v1/auth/forgot-password'),
        body: jsonEncode(forgotData),
      );

      if (res.statusCode == 200) {
        dismiss();
        EasyLoading.showSuccess('Reset request successful');
        log('reset_code ::: + ${jsonDecode(res.body)["data"]['reset_code']}');
        box.write('reset_code', jsonDecode(res.body)["data"]['reset_code']);
        return true;
      } else {
        dismiss();
        log(res.body);
        log('Account failed');
        return false;
      }
    } catch (e) {
      dismiss();
      log(e.toString());
    }
  }

  Future<dynamic> resetPassword(Map<String, dynamic> forgotData) async {
    var headers = {'Content-Type': 'application/json'};
    EasyLoading.show(status: 'Resetting Password...');
    try {
      var res = await http.post(
        headers: headers,
        Uri.parse('$baseUrl/api/v1/auth/reset-password'),
        body: jsonEncode(forgotData),
      );

      if (res.statusCode == 200) {
        dismiss();
        EasyLoading.showSuccess('Password reset successfully');

        return true;
      } else {
        dismiss();
        log(res.body);
        log('Account failed');
        return false;
      }
    } catch (e) {
      dismiss();
      log(e.toString());
    }
  }

  dismiss() {
    EasyLoading.dismiss();
  }
}
