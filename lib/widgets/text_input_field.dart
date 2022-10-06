import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:get/get.dart';

class TextInputField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final bool? autoValidate;
  const TextInputField({
    Key? key,
    required this.obscureText,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.autoValidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is required';
        } else if (hintText.toLowerCase().contains('email')) {
          if (!GetUtils.isEmail(value)) {
            return 'Please enter a valid email address';
          }
        } else if (hintText.toLowerCase().contains('phone')) {
          if (!GetUtils.isPhoneNumber(value)) {
            return 'Please enter a valid phone number';
          }
        }
        return null;
      },
      autofocus: false,
      obscureText: obscureText,
      onChanged: onChanged,
      autovalidateMode: autoValidate != null
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: hintText,
        errorText: errorText,
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
        suffix: suffixIcon,
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: getProportionateScreenHeight(18),
      ),
    );
  }
}
