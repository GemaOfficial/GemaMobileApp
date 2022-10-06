import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/authentication/login/login_screen.dart';
import 'package:gema_mobile/screens/authentication/reset/controller/controller.dart';
import 'package:gema_mobile/screens/authentication/reset/reset_password.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/landing_logo.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:gema_mobile/widgets/text_input_field.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetView<ForgotController> {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.forgotFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LandingLogoWidget(),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      "Enter your email address and we will send you your recovery link",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  TextInputField(
                    obscureText: false,
                    hintText: "Email",
                    controller: controller.emailCtrlr,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  PrimaryButton(
                    "Submit",
                    height: getProportionateScreenHeight(50),
                    onTap: () async {
                      final res = await controller.forgotPassword();
                      if (res) {
                        Get.to(() => const ResetPassword());
                      } else {
                        Get.snackbar(
                          "Error",
                          "An error occured",
                          backgroundColor: kSecondaryColor,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text(
                      "Login to your account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
