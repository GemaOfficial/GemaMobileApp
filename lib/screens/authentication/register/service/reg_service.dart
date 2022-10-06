import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegService {
  final _storage = GetStorage();
  Future<dynamic> registerUser(Map<String, dynamic> regData) async {
    var headers = {'Content-Type': 'application/json'};
    EasyLoading.show(status: 'Creating account...');
    try {
      var res = await http.post(
        headers: headers,
        Uri.parse('$baseUrl/api/v1/auth/register'),
        body: jsonEncode(regData),
      );

      log(regData.toString());
      log(res.statusCode.toString());

      if (res.statusCode == 200) {
        dismiss();
        EasyLoading.showSuccess('Account created successfully');
        _storage.write('user_token', jsonDecode(res.body)['token']);
        return true;
      } else {
        log(res.body);
        // EasyLoading.showError('Failed to create account ${res.body}');
        if ('${jsonDecode(res.body)['msg']}'
            .contains("Account Id already exists")) {
          EasyLoading.showError('Username already exists');
        } else {
          EasyLoading.showError('${jsonDecode(res.body)['msg']}');
        }

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
