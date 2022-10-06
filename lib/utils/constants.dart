import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';

const TextStyle textStyle = TextStyle(
  fontFamily: 'Supermolot',
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

OutlineInputBorder errorBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.red,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kSecondaryColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder disabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kSecondaryColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder enabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kSecondaryColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.red,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10),
);

// const baseUrl = 'http://54.226.253.189';
const baseUrl = 'https://api.gemaofficial.io';
