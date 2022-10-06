import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/settings/controller/settings_controller.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:get/get.dart';

class SettingsOptions extends StatelessWidget {
  SettingsOptions({
    Key? key,
    required List<Map<String, dynamic>> settingsOptions,
  })  : _settingsOptions = settingsOptions,
        super(key: key);

  final List<Map<String, dynamic>> _settingsOptions;
  final ctrl = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _settingsOptions.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            log('${_settingsOptions[index]['title']} tapped');
            ctrl.setSettingsIndex(index + 1);
          },
          title: Text(
            _settingsOptions[index]['title'],
            style: textStyle.copyWith(
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.w700,
                fontFamily: 'Zwodrei'),
          ),
          trailing: SizedBox(
            width: getProportionateScreenWidth(62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _settingsOptions[index]['trailing'],
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(13),
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF6A6D8B),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(4),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: getProportionateScreenHeight(16),
                  color: const Color(0xFF6A6D8B),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
