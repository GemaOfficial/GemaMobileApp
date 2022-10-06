import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gema_mobile/di/wallet_bindings.dart';
import 'package:gema_mobile/screens/authentication/login/controller/controller.dart';
import 'package:gema_mobile/screens/authentication/register/registration_screen.dart';
import 'package:gema_mobile/screens/authentication/reset/forgot_password.dart';
import 'package:gema_mobile/screens/main_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/landing_logo.dart';
import 'package:gema_mobile/widgets/phone_input_field.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:gema_mobile/widgets/text_input_field.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LandingLogoWidget(),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(30),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  PhoneInputField(
                    controller: controller.phoneCtrlr,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Obx(
                    () => TextInputField(
                      controller: controller.passCtrlr,
                      obscureText: controller.isPasswdObscure.value,
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () => controller.togglePasswordVisibility(),
                        child: Icon(
                          (controller.isPasswdObscure.value == true)
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  PrimaryButton(
                    "Login",
                    height: getProportionateScreenHeight(50),
                    onTap: () async {
                      var res = await controller.loginUser();
                      if (res) {
                        log("Login successful");
                        Get.offAll(
                          () => const MainScreen(),
                          binding: WalletBindings(),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterScreen());
                    },
                    child: Text(
                      "Create a new account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(17),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const ForgotPassword(),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Supermolot",
                        fontWeight: FontWeight.w500,
                        fontSize: getProportionateScreenHeight(16),
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
