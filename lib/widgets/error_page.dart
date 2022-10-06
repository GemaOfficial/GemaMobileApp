import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  "assets/images/error.png",
                  height: getProportionateScreenHeight(94),
                  width: getProportionateScreenWidth(94),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(
                "Error",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(30),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(
                "Check your connection and try again",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Supermolot",
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                "Refresh",
                height: getProportionateScreenHeight(46),
                onTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
