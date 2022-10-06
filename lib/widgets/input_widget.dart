import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';

class InputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputAction textInputAction;
  final double? height;
  final double? width;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  const InputWidget(
    this.labelText,
    this.hintText,
    this.textInputAction, {
    this.height,
    this.width,
    Key? key,
    this.onChanged,
    this.controller,
    this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? getProportionateScreenHeight(48),
      width: width ?? SizeConfig.screenWidth,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        obscureText: obscureText ?? false,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          labelText: labelText,
          hintText: hintText,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          counterStyle: const TextStyle(color: kSecondaryColor),
          prefixStyle: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(16),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(16),
          ),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: getProportionateScreenHeight(16),
          ),
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          disabledBorder: disabledBorder,
          focusedErrorBorder: focusedErrorBorder,
          suffixIcon: suffixIcon,
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenHeight(16),
        ),
      ),
    );
  }
}
