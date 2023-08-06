import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gema_mobile/models/token_model.dart';
import 'package:gema_mobile/screens/wallet/models/my_tokens.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {
  final storage = GetStorage();

  // final _walletService = MyTokenService();

  TextEditingController sendAmountCtrl = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<TokenModel> userTokens = [];
  TokenModel? selectedToken;

  @override
  void onInit() async {
    userTokens.clear();
    log("Length of TokenList${userTokens.length}");
    await fetchTokenList();

    if (userTokens.isNotEmpty) {
      selectedToken = (selectedToken == null) ? userTokens[0] : selectedToken;
    }
    
    update();
    super.onInit();
  }

  Future<List<TokenModel>?> fetchTokenList() async {
    userTokens.clear();

    var token = await storage.read('user_token');
    var phoneNumber = await storage.read('phone_number');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'x-auth-token $token',
    };

    try {
      final res = await http.post(
        Uri.parse("$baseUrl/api/v1/profile/tokens"),
        headers: headers,
        body: jsonEncode(
          {
            "phone_number": phoneNumber,
          },
        ),
      );

      if (res.statusCode == 200) {
        final myTokens = MyTokens.fromJson(jsonDecode(res.body));

        log("Fetched tokens suceesfuly");

        for (int i = 0; i < myTokens.data.length; i++) {
          userTokens.add(
            TokenModel(
              name: myTokens.data[i].name,
              symbol: myTokens.data[i].symbol,
              iconUrl: "https://",
              balance: myTokens.data[i].value.toString(),
              fiatValue: "0",
            ),
          );
        }
        return userTokens;
      } else {
        log("Could not fetch token list from server due to error ${res.statusCode}");
      }
    } catch (e) {
        log("Could not fetch token list }");
      log(e.toString());
    }
    return null;
  }

  selectToken(int index) async {
    selectedToken = userTokens[index];
    update();
  }
}
