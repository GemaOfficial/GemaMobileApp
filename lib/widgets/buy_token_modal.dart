import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/primary_button.dart';

class BuyTokenModal extends StatelessWidget {
  const BuyTokenModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.5,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Enter Amount",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              const BuyInputField(
                abbrv: "KES",
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              const Icon(
                Icons.swap_vert,
                color: kSecondaryColor,
                size: 32,
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              const BuyInputField(
                abbrv: "GEM",
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(
                "You will receive",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.5,
                child: PrimaryButton(
                  "Approve",
                  height: getProportionateScreenHeight(50),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuyInputField extends StatelessWidget {
  final String abbrv;
  const BuyInputField({
    Key? key,
    required this.abbrv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.9,
      height: getProportionateScreenHeight(50),
      child: TextFormField(
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          suffixIcon: SizedBox(
            width: getProportionateScreenWidth(100),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getProportionateScreenWidth(2),
                    height: getProportionateScreenHeight(48),
                    decoration: const BoxDecoration(color: Color(0xFF2E506F)),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    abbrv,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(30),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Color(0xFFA3A7C5),
                  ),
                ],
              ),
            ),
          ),
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
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenHeight(18),
        ),
      ),
    );
  }
}
