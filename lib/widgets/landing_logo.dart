import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/size_config.dart';

class LandingLogoWidget extends StatelessWidget {
  const LandingLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(260),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/rect.png",
              height: getProportionateScreenHeight(146),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset("assets/images/landing.png"),
          ),
        ],
      ),
    );
  }
}
