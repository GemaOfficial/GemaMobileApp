import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:gema_mobile/utils/constants.dart';

class LoginService {
  final _storage = GetStorage();
  Future<dynamic> loginUser(Map<String, dynamic> loginData) async {
    var headers = {'Content-Type': 'application/json'};
    EasyLoading.show(status: 'Logging in...');
    try {
      var res = await http.post(
        headers: headers,
        Uri.parse('$baseUrl/api/v1/auth/login'),
        body: jsonEncode(loginData),
      );

      log("Response Body${res.body}");

      if (res.statusCode == 200) {
        dismiss();
        EasyLoading.showSuccess('Login successful');
        log('token ::: + ${jsonDecode(res.body)['token']}');
        _storage.write('user_token', jsonDecode(res.body)['token']);
        return true;
      } else {
        EasyLoading.showError('${jsonDecode(res.body)['msg']}');
        log(res.body);
        log('User login failed');
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
