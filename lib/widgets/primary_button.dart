import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? icon;
  const PrimaryButton(
    this.text, {
    required this.height,
    this.width,
    required this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(8),
          ),
          color: kPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF26283B),
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
