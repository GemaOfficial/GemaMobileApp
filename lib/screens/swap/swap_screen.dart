import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/screens/swap/swap_success_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(
            MdiIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Send',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            SendWidget(
              tokenAmount: '11.33',
              tokenSymbol: 'BTC',
              fiatValue: '94.33',
              iconLogo: MdiIcons.bitcoin,
              iconColor: Color(0xFFF7931A),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            SendWidget(
              tokenAmount: '1789.33',
              tokenSymbol: 'ETH',
              fiatValue: '563.33',
              iconLogo: MdiIcons.ethereum,
            ),
            const Spacer(),
            PrimaryButton(
              'Swap',
              height: getProportionateScreenHeight(46),
              onTap: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: kBgColor,
                  isScrollControlled: true,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        height: SizeConfig.screenHeight * 0.56,
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(27),
                          vertical: getProportionateScreenHeight(20),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B1D32),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              getProportionateScreenHeight(16),
                            ),
                            topRight: Radius.circular(
                              getProportionateScreenHeight(16),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(5),
                              width: getProportionateScreenWidth(41),
                              margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(10),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDDDEED),
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(100),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(27),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.pop(context);
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(113),
                                ),
                                Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(25),
                            ),
                            Container(
                              height: getProportionateScreenHeight(230),
                              width: getProportionateScreenWidth(343),
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(15),
                                vertical: getProportionateScreenHeight(14),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF23253B),
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  ConfirmSendWidget(
                                    'Rate',
                                    trailingWidget: RichText(
                                      text: TextSpan(
                                        text: '12',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              getProportionateScreenWidth(14),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' BTC',
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  const Divider(
                                    color: Color(0xFF383B59),
                                  ),
                                  ConfirmSendWidget(
                                    'Inverse rate',
                                    trailingWidget: Column(
                                      children: [
                                        Text(
                                          '12 GEM',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(5),
                                        ),
                                        Text(
                                          '\$563.33',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize:
                                                getProportionateScreenWidth(14),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  const Divider(
                                    color: Color(0xFF383B59),
                                  ),
                                  ConfirmSendWidget(
                                    'USD price',
                                    trailingWidget: Column(
                                      children: [
                                        Text(
                                          '1 GEM',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(5),
                                        ),
                                        Text(
                                          '\$563.33',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize:
                                                getProportionateScreenWidth(14),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  const Divider(
                                    color: Color(0xFF383B59),
                                  ),
                                  ConfirmSendWidget(
                                    'Estimated fee',
                                    trailingWidget: RichText(
                                      text: TextSpan(
                                        text: '12',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              getProportionateScreenWidth(14),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' BTC',
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(27),
                            ),
                            PrimaryButton(
                              'Send',
                              height: getProportionateScreenHeight(46),
                              onTap: () {
                                EasyLoading.show(status: 'Swapping..');
                                Future.delayed(
                                  const Duration(seconds: 3),
                                  () {
                                    EasyLoading.dismiss();
                                    Get.offAll(() => const SendSuccessScreen());
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
          ],
        ),
      )),
    );
  }
}

class ConfirmSendWidget extends StatelessWidget {
  final String title;
  final Widget trailingWidget;
  const ConfirmSendWidget(
    this.title, {
    required this.trailingWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailingWidget,
      ],
    );
  }
}

class SendWidget extends StatelessWidget {
  final String tokenAmount;
  final String tokenSymbol;
  final String fiatValue;
  final IconData iconLogo;
  final Color? iconColor;
  const SendWidget({
    required this.tokenAmount,
    required this.tokenSymbol,
    required this.fiatValue,
    required this.iconLogo,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(12),
        horizontal: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF23253B),
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'From',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(14),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Use max',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFFA3A7C5),
                    fontSize: getProportionateScreenHeight(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    tokenAmount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    '\$$fiatValue',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenHeight(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    iconLogo,
                    color: iconColor ?? Colors.white,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  RichText(
                    text: TextSpan(
                      text: tokenSymbol,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(14),
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(13)),
                  Icon(
                    MdiIcons.chevronDown,
                    color: Color(0xFFA3A7C5),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
