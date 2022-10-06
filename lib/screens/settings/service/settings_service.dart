import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:get_storage/get_storage.dart';

class SettingService {
  final _storage = GetStorage();

  Future<dynamic> updateProfile(Map<String, dynamic> profileData) async {
    EasyLoading.show(status: 'Updating profile...');
    try {
      var token = await _storage.read('user_token');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'x-auth-token $token',
      };

      var res = await http.post(
        headers: headers,
        Uri.parse('$baseUrl/api/v1/profile/update'),
        body: jsonEncode(profileData),
      );

      if (res.statusCode == 200) {
        EasyLoading.showSuccess('${jsonDecode(res.body)['msg']}');
        log(res.body);
        return true;
      } else {
        EasyLoading.showError('${jsonDecode(res.body)['msg']}');
        log(res.body);
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
