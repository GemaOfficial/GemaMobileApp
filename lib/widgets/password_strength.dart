import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PasswdStrengthWidget extends StatelessWidget {
  final String muscle;
  final bool isFlexed;
  const PasswdStrengthWidget(
    this.muscle,
    this.isFlexed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          MdiIcons.checkCircle,
          color: isFlexed ? kPrimaryColor : const Color(0xffc4c4c4),
          size: getProportionateScreenWidth(12),
        ),
        SizedBox(
          width: getProportionateScreenWidth(8),
        ),
        Text(muscle, style: textStyle, textAlign: TextAlign.left),
      ],
    );
  }
}
