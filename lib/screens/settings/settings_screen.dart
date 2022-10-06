import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/settings/controller/settings_controller.dart';
import 'package:gema_mobile/screens/settings/widgets/add_card.dart';
import 'package:gema_mobile/screens/settings/widgets/change_password.dart';
import 'package:gema_mobile/screens/settings/widgets/settings_options.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settingsCtrl = Get.find<SettingsController>();

  final List<Map<String, dynamic>> _settingsOptions = [
    {
      'title': 'Language',
      'trailing': 'English',
      // 'route': GeneralSettingsScreen.routeName,
    },
    {
      'title': 'Pin Setup',
      'trailing': 'Enable',
      // 'route': SecuritySettingsScreen.routeName,
    },
    {
      'title': 'Change Password',
      'trailing': 'Change',
      // 'route': AboutSettingsScreen.routeName,
    },
    {
      'title': 'Enable Two-Factor Authentication',
      'trailing': '2FA',
      // 'route': AboutSettingsScreen.routeName,
    },
    {
      'title': 'Payment Options',
      'trailing': 'Change',
      // 'route': AboutSettingsScreen.routeName,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        leading: InkWell(
          onTap: () => settingsCtrl.resetSettings(),
          child: const Icon(MdiIcons.chevronLeft),
        ),
        title: Text(
          'Settings',
          style: textStyle.copyWith(
            fontSize: getProportionateScreenHeight(16),
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              if (settingsCtrl.settingsIndex.value == 0) ...[
                SettingsOptions(settingsOptions: _settingsOptions),
              ] else if (settingsCtrl.settingsIndex.value == 1) ...[
                SizedBox(
                  child: Center(
                    child: Text(
                      _settingsOptions[0]['title'],
                      style: textStyle,
                    ),
                  ),
                )
              ] else if (settingsCtrl.settingsIndex.value == 2) ...[
                SizedBox(
                  child: Center(
                    child: Text(
                      _settingsOptions[1]['title'],
                      style: textStyle,
                    ),
                  ),
                )
              ] else if (settingsCtrl.settingsIndex.value == 3) ...[
                const ChangePassWidget(),
              ] else if (settingsCtrl.settingsIndex.value == 4) ...[
                SizedBox(
                  child: Center(
                    child: Text(
                      _settingsOptions[3]['title'],
                      style: textStyle,
                    ),
                  ),
                )
              ] else if (settingsCtrl.settingsIndex.value == 5) ...[
                const AddCardWidget()
              ],
            ],
          ),
        ),
      ),
    );
  }
}
