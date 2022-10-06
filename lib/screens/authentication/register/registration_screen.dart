import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/authentication/login/login_screen.dart';
import 'package:gema_mobile/screens/authentication/register/controller/controller.dart';
import 'package:gema_mobile/screens/main_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/error_page.dart';
import 'package:gema_mobile/widgets/landing_logo.dart';
import 'package:gema_mobile/widgets/phone_input_field.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:gema_mobile/widgets/text_input_field.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.regFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: LandingLogoWidget(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(30),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  PhoneInputField(
                    controller: controller.phoneCtrlr,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  TextInputField(
                    controller: controller.emailCtrlr,
                    obscureText: false,
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  TextInputField(
                    controller: controller.usernameCtrlr,
                    obscureText: false,
                    hintText: "Username",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  Obx(() => TextFormField(
                        controller: controller.passCtrlr,
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password must be at least 8 characters long";
                          } else if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return "Password must contain at least one uppercase letter, one number and one special character";
                          } else if (value.length >= 8 &&
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                            return null;
                          }
                          return null;
                        },
                        autofocus: false,
                        obscureText: controller.isLoginPasswdObscure.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          labelText: "Password",
                          // errorText: errorText,
                          errorMaxLines: 3,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          counterStyle: const TextStyle(color: kSecondaryColor),
                          prefixStyle: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenHeight(20),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: getProportionateScreenHeight(18),
                          ),
                          enabledBorder: enabledBorder,
                          errorBorder: errorBorder,
                          focusedBorder: focusedBorder,
                          disabledBorder: disabledBorder,
                          focusedErrorBorder: focusedErrorBorder,
                          suffix: GestureDetector(
                            onTap: () => controller.togglePasswordVisibility(),
                            child: Icon(
                              (controller.isPasswordObscure.value == true)
                                  ? MdiIcons.eyeOutline
                                  : MdiIcons.eyeOffOutline,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenHeight(18),
                        ),
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  // (controller.passwordsMatch.value == false)
                  //     ? Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "At least 8 characters",
                  //               controller.is8Characters.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains an uppercase character",
                  //               controller.containsUpperCase.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains a number",
                  //               controller.containsNumber.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains an special character",
                  //               controller.isSpecialChar.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //         ],
                  //       )
                  //     : Container(),      // (controller.passwordsMatch.value == false)
                  //     ? Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "At least 8 characters",
                  //               controller.is8Characters.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains an uppercase character",
                  //               controller.containsUpperCase.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains a number",
                  //               controller.containsNumber.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //           Obx(
                  //             () => PasswdStrengthWidget(
                  //               "Contains an special character",
                  //               controller.isSpecialChar.value,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: getProportionateScreenHeight(4),
                  //           ),
                  //         ],
                  //       )
                  //     : Container(),

                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  Obx(
                    () => TextInputField(
                      controller: controller.confirmPassCtrlr,
                      obscureText: controller.isConfirmPasswordObscure.value,
                      hintText: "Confirm Password",
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            controller.toggleConfirmPasswordVisibility(),
                        child: Icon(
                          (controller.isPasswordObscure.value == true)
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  PrimaryButton(
                    "Create Account",
                    height: getProportionateScreenHeight(50),
                    onTap: () async {
                      var res = await controller.registerUser();
                      if (res == null) {
                        Get.to(() => const ErrorScreen());
                      } else if (res) {
                        Get.to(
                          () => const MainScreen(),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
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
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  // Text(
                  //   "Forgot password?",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: "Supermolot",
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: getProportionateScreenHeight(16),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
