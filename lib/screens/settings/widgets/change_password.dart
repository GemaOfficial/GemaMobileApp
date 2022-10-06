import 'package:flutter/material.dart';
import 'package:gema_mobile/screens/settings/controller/settings_controller.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/input_widget.dart';
import 'package:gema_mobile/widgets/landing_logo.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChangePassWidget extends GetView<SettingsController> {
  const ChangePassWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.profileFormKey,
            child: Column(
              children: [
                const LandingLogoWidget(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Obx(
                  () => InputWidget(
                    controller: controller.currPasswdCtrlr,
                    "Current Password",
                    'Enter your current password',
                    TextInputAction.next,
                    obscureText: controller.isCurrObscure.value,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.toggleCurrent(),
                      child: Icon(
                        (controller.isCurrObscure.value == true)
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                Obx(
                  () => InputWidget(
                    controller: controller.newPasswdCtrlr,
                    "New Password",
                    'Enter your new password',
                    TextInputAction.next,
                    obscureText: controller.isNewObscure.value,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.toggleNew(),
                      child: Icon(
                        (controller.isCurrObscure.value == true)
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                Obx(
                  () => InputWidget(
                    controller: controller.confirmPasswdCtrlr,
                    "Confirm New Password",
                    'Confirm New password',
                    TextInputAction.done,
                    obscureText: controller.isConfirmObscure.value,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.toggleConfirm(),
                      child: Icon(
                        (controller.isCurrObscure.value == true)
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                PrimaryButton(
                  "Save",
                  height: getProportionateScreenHeight(50),
                  onTap: () async {
                    await controller.updateProfile();
                  },
                  icon: Icon(
                    MdiIcons.chevronRight,
                    color: const Color(0xFF272727),
                    size: getProportionateScreenHeight(22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
