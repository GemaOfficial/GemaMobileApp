// To parse this JSON data, do
//
//     final myTokens = myTokensFromJson(jsonString);

import 'dart:convert';

MyTokens myTokensFromJson(String str) => MyTokens.fromJson(json.decode(str));

String myTokensToJson(MyTokens data) => json.encode(data.toJson());

class MyTokens {
  MyTokens({
    required this.success,
    required this.data,
  });

  bool success;
  List<TokenInfo> data;

  factory MyTokens.fromJson(Map<String, dynamic> json) => MyTokens(
        success: json["success"],
        data: List<TokenInfo>.from(
            json["data"].map((x) => TokenInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TokenInfo {
  TokenInfo({
    required this.token,
    required this.name,
    required this.symbol,
    required this.value,
    required this.image,
  });

  String token;
  String name;
  String symbol;
  int value;
  dynamic image;

  factory TokenInfo.fromJson(Map<String, dynamic> json) => TokenInfo(
        token: json["token"],
        name: json["name"],
        symbol: json["symbol"],
        value: json["value"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "symbol": symbol,
        "value": value,
        "image": image,
      };
}
