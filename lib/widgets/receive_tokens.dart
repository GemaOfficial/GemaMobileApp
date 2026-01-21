import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ReceiveTokens extends StatelessWidget {
  final String userName;
  const ReceiveTokens({Key? key, required this.userName}) : super(key: key);

  _onSharedAddress(BuildContext context, String address) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(address,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.62,
      decoration: const BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenHeight(5),
              decoration: BoxDecoration(
                color: const Color(0xFFDDDEED).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              'Receive GEM Tokens',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: "Supermolot",
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.45,
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF7CE5DF),
                    const Color(0xFF7CE5DF).withOpacity(0.1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kBgColor,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  width: SizeConfig.screenWidth * 0.3,
                  height: SizeConfig.screenHeight * 0.27,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: QrImageView(
                      data: userName,
                      version: QrVersions.auto,
                      errorCorrectionLevel: QrErrorCorrectLevel.Q,
                      size: 150.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              "Scan QR code to receive payment",
              style: TextStyle(
                color: const Color(0xFFA3A7C5),
                fontSize: getProportionateScreenHeight(15),
                fontWeight: FontWeight.w400,
                fontFamily: "Supermolot",
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    Clipboard.setData(ClipboardData(text: userName))
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Wallet address $userName copied to clipboard");
                    });
                  },
                  child: Container(
                    width: SizeConfig.screenWidth * 0.45,
                    height: getProportionateScreenHeight(37),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.copy,
                            color: kSecondaryColor,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(4),
                          ),
                          Text(
                            "Copy",
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),
                              color: kSecondaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    _onSharedAddress(context, userName);
                  },
                  child: Container(
                    width: SizeConfig.screenWidth * 0.45,
                    height: getProportionateScreenHeight(37),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.share,
                            color: kSecondaryColor,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(4),
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),
                              color: kSecondaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: getProportionateScreenHeight(35),
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Send",
                  style: TextStyle(fontSize: getProportionateScreenHeight(16)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
