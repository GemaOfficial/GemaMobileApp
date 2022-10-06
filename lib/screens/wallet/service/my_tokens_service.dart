import 'dart:convert';
import 'dart:developer';

import 'package:gema_mobile/screens/authentication/login/models/user_model.dart';
import 'package:gema_mobile/screens/wallet/models/my_tokens.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyTokenService {
  final _storage = GetStorage();

  Stream<List<TokenInfo>> fetchMyTokens() async* {
    var token = await _storage.read('user_token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'x-auth-token $token',
    };
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      try {
        final res = await http.post(
          Uri.parse("$baseUrl/api/v1/profile/tokens"),
          headers: headers,
          body: jsonEncode(
            {
              "username": "rennylngt",
            },
          ),
        );

        if (res.statusCode == 200) {
          final myTokens = MyTokens.fromJson(jsonDecode(res.body));
          log(myTokens.toString());
          yield myTokens.data;
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  Future<UserClass?> fetchUserInfo() async {
    var token = await _storage.read('user_token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'x-auth-token $token',
    };

    try {
      final res = await http.get(
        Uri.parse("$baseUrl/api/v1/auth"),
        headers: headers,
      );
      if (res.statusCode == 200) {
        final userInfo = User.fromJson(jsonDecode(res.body));
        log('userInfo >> $userInfo');
        await _storage.write('curr_username', userInfo.user.username);
        return userInfo.user;
      } else {
        log(res.body);
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
