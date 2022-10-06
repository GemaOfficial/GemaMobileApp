import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
    required this.success,
  });

  UserClass user;
  bool success;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "success": success,
      };
}

class UserClass {
  UserClass({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.favorite,
    required this.wallet,
    required this.preferredLang,
    required this.subscribed,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    required this.id,
  });

  String? username;
  String? email;
  String? phoneNumber;
  List<dynamic> favorite;
  Wallet wallet;
  String? preferredLang;
  bool? subscribed;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;
  String? id;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        wallet: Wallet.fromJson(json["wallet"]),
        preferredLang: json["preferred_lang"],
        subscribed: json["subscribed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "favorite": List<dynamic>.from(favorite.map((x) => x)),
        "wallet": wallet.toJson(),
        "preferred_lang": preferredLang,
        "subscribed": subscribed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "image": image,
        "id": id,
      };
}

class Wallet {
  Wallet({
    required this.publicKey,
    required this.walletType,
  });

  String publicKey;
  String walletType;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        publicKey: json["public_key"],
        walletType: json["wallet_type"],
      );

  Map<String, dynamic> toJson() => {
        "public_key": publicKey,
        "wallet_type": walletType,
      };
}
