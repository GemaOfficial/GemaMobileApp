//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

List<ErrorModel> errorModelFromJson(String str) =>
    List<ErrorModel>.from(json.decode(str).map((x) => ErrorModel.fromJson(x)));

String errorModelToJson(List<ErrorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ErrorModel {
  ErrorModel({
    this.msg,
    this.field,
    this.success,
  });

  String? msg;
  String? field;
  bool? success;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        msg: json["msg"],
        field: json["field"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "field": field,
        "success": success,
      };
}
