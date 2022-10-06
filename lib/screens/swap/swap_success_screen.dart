import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/main_screen.dart';
// import 'package:gema_mobile/screens/swap/widgets/confetti.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:get/get.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SendSuccessScreen extends StatefulWidget {
  const SendSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SendSuccessScreen> createState() => _SendSuccessScreenState();
}

class _SendSuccessScreenState extends State<SendSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            top: getProportionateScreenWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: getProportionateScreenHeight(200),
              //   child: AllConfettiWidget(
              //     child: Container(
              //       decoration: const BoxDecoration(
              //         color: kBgColor,
              //       ),
              //     ),
              //   ),
              // ),
              // Icon(
              //   MdiIcons.checkCircle,
              //   color: kGreenColor,
              //   size: getProportionateScreenWidth(82),
              // ),
              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(140),
                  left: getProportionateScreenWidth(54),
                  right: getProportionateScreenWidth(54),
                ),
                child: Image.asset('assets/images/send_success.png'),
              ),
              SizedBox(
                height: getProportionateScreenWidth(45),
              ),
              Text(
                'Success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Zwodrei',
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Text(
                'Successfully sent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFDDDEED),
                  fontFamily: 'Supermolot',
                ),
              ),
              const Spacer(),
              PrimaryButton(
                'Return to screen',
                height: getProportionateScreenHeight(46),
                onTap: () => Get.offAll(() => const MainScreen()),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
