import 'package:flutter/material.dart';
import 'package:gema_mobile/di/wallet_bindings.dart';
import 'package:gema_mobile/screens/authentication/login/login_screen.dart';
import 'package:gema_mobile/screens/authentication/register/registration_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/landing_logo.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const LandingLogoWidget(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Account Setup",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                "Login to your account or create a new one.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Supermolot",
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const LoginScreen(),
                  binding: WalletBindings(),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        )
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const RegisterScreen(),
                  binding: WalletBindings(),
                );
              },
              child: const Text(
                "Create a new account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
