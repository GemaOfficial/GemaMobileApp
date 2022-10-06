import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController? controller;
  const PhoneInputField({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: ((value) {
      //   if (value!.isEmpty) {
      //     return 'Phone number is required';
      //   } else if (!GetUtils.isPhoneNumber(value)) {
      //     return 'Please enter a valid phone number';
      //   }
      //   return null;
      // }),
      maxLength: 9,
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: "phone number",
        prefixText: "+254 ",
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
    );
  }
}
