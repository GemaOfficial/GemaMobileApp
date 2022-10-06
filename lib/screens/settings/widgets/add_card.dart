import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/input_widget.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({
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
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(
                'Add your Card Details',
                style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(16),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Zwodrei'),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              const InputWidget(
                "Name",
                'Enter Name on Card',
                TextInputAction.next,
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              const InputWidget(
                "Card Number",
                'Enter your Card Number',
                TextInputAction.next,
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              const InputWidget(
                "Address",
                'Enter your Address',
                TextInputAction.done,
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputWidget(
                    "Expiry Date",
                    'Expiry Date',
                    TextInputAction.done,
                    width: getProportionateScreenWidth(118),
                  ),
                  InputWidget(
                    "CVV",
                    'CVV',
                    TextInputAction.done,
                    width: getProportionateScreenWidth(118),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              PrimaryButton(
                "Save",
                height: getProportionateScreenHeight(50),
                onTap: () {
                  EasyLoading.show(status: 'Saving...');
                  Future.delayed(const Duration(seconds: 3), () {
                    EasyLoading.showSuccess('Operation Successful');
                  });
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
    );
  }
}
