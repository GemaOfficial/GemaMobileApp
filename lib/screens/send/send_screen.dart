import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:gema_mobile/models/favorites_model.dart';
import 'package:gema_mobile/screens/send/scan_qr_code.dart';

import 'package:gema_mobile/controllers/wallet_controller.dart';

import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SendScreen extends GetView<WalletController> {
  const SendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isValid = false.obs;

    // final connectivityResult = await (Connectivity().checkConnectivity());

    var isConnected = false.obs;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        title: Text(
          "Amount",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
      ),
      body: 
      // (!isConnected.value) ? null :
      // () ? NoToken:
      FutureBuilder(
          future: controller.fetchTokenList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GetBuilder<WalletController>(
                    builder: (_) => Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 36, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                      ),
                                    ),
                                    builder: (context) {
                                      return Container(
                                        height: SizeConfig.screenHeight * 0.5,
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenWidth(27),
                                          vertical:
                                              getProportionateScreenHeight(20),
                                        ),
                                        decoration: const BoxDecoration(
                                          color: kBgColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      5),
                                              width:
                                                  getProportionateScreenWidth(
                                                      41),
                                              margin: EdgeInsets.only(
                                                top:
                                                    getProportionateScreenHeight(
                                                        10),
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFDDDEED),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getProportionateScreenHeight(
                                                      100),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      27),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Icon(
                                                    MdiIcons.chevronLeft,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          113),
                                                ),
                                                Text(
                                                  'Tokens',
                                                  style: textStyle.copyWith(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      17),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: controller
                                                    .userTokens.length,
                                                itemBuilder: (context, index) {
                                                  return SendTokenWidget(
                                                    controller
                                                        .userTokens[index].name,
                                                    controller.userTokens[index]
                                                        .symbol,
                                                    balance: controller
                                                        .userTokens[index]
                                                        .balance,
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      controller
                                                          .selectToken(index);
                                                    },
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: getProportionateScreenWidth(160),
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(120),
                                          child: Text(
                                            'None',//'{controller.selectedToken?.name}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      14),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(5),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          size: 26,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.sendAmountCtrl.text = "0";
                                      // controller.selectedToken!.balance;
                                },
                                child: Text(
                                  "Use Max",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getProportionateScreenHeight(16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(170),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller.sendAmountCtrl,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenHeight(42),
                            ),
                            cursorHeight: getProportionateScreenHeight(48),
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              hintText: '0',// controller.selectedToken!.balance,
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                                fontSize: getProportionateScreenHeight(42),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                isValid.value = true;
                              } else {
                                isValid.value = false;
                              }
                            },
                            validator: (value) {
                              if(value != null) {
                                if (value.isEmpty) {
                                  return "Amount required";
                                }
                              }

                              return null;
                            },
                          ),
                        ),

                        // Text(
                        //   "119.7912",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: getProportionateScreenHeight(42),
                        //   ),
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Container(
                          width: getProportionateScreenWidth(120),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(160),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // "\$ {controller.selectedToken?.fiatValue ?? controller.userTokens[0].fiatValue}",
                                  "0",
                                  style: TextStyle(
                                    color: kSecondaryColor,
                                    fontFamily: "Supermolot",
                                    fontWeight: FontWeight.w600,
                                    fontSize: getProportionateScreenHeight(16),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(7),
                                ),
                                const Icon(
                                  MdiIcons.swapVertical,
                                  size: 22,
                                  color: kSecondaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Text(
                          "Balance 0", // ${controller.selectedToken?.balance ?? controller.userTokens[0].balance} ${controller.selectedToken?.symbol ?? controller.userTokens[0].symbol}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenHeight(16),
                            fontFamily: "Supermolot",
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () => GestureDetector(
                            onTap: () => (isValid.value ||
                                    controller.sendAmountCtrl.text.isNotEmpty)
                                ? sendNextStep(context)
                                : null,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.8,
                              height: getProportionateScreenHeight(46),
                              decoration: BoxDecoration(
                                  color: (isValid.value ||
                                          controller
                                              .sendAmountCtrl.text.isNotEmpty)
                                      ? kSecondaryColor
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }

  sendNextStep(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        builder: (context) {
          return SendTokenStep2(controller: controller);
        });
  }
}

class SendTokenStep1 extends StatelessWidget {
  const SendTokenStep1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WalletController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.86,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(27),
        vertical: getProportionateScreenHeight(20),
      ),
      decoration: const BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Text(
            'Send Tokens',
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(17),
          ),
          Container(
            height: getProportionateScreenHeight(50),
            decoration: BoxDecoration(
              color: const Color(0xFF23253B),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
                vertical: getProportionateScreenHeight(9),
              ),
              child: Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(32),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/profile.png',
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(17),
                  ),
                  Text(
                    'Lincoin Gakuya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    MdiIcons.chevronDown,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                builder: (context) {
                  return SendTokenStep1(
                    controller: controller,
                  );
                },
              );
            },
            child: Container(
              width: SizeConfig.screenWidth * 0.8,
              height: getProportionateScreenHeight(46),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SendTokenWidget extends StatelessWidget {
  final String tokenName;
  final String tokenSymbol;
  final String balance;
  final VoidCallback onTap;
  const SendTokenWidget(
    this.tokenName,
    this.tokenSymbol, {
    required this.onTap,
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(14),
            vertical: getProportionateScreenHeight(10)),
        height: getProportionateScreenHeight(90),
        margin: EdgeInsets.only(
          bottom: getProportionateScreenHeight(5),
          top: getProportionateScreenHeight(10),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(10),
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF25273A),
              Color(0xFF2E314D),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  MdiIcons.bitcoin,
                  color: const Color(0xFFF7931A),
                  size: getProportionateScreenHeight(30),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                RichText(
                  text: TextSpan(
                    text: tokenName,
                    style: textStyle.copyWith(
                      fontSize: getProportionateScreenWidth(14),
                    ),
                    children: [
                      TextSpan(
                        text: ' $tokenSymbol',
                        style: textStyle.copyWith(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$balance " "$tokenSymbol",
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  '\$0.00',
                  style: textStyle.copyWith(
                    color: const Color(0xFFA3A7C5),
                    fontSize: getProportionateScreenHeight(12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SendTokenStep2 extends StatelessWidget {
  // final TextEditingController addressController;
  final WalletController controller;
  SendTokenStep2({
    Key? key,
    // required this.addressController,
    required this.controller,
  }) : super(key: key);

  final List<FavoritesModel> _favsList = [
    FavoritesModel(
      name: 'Manuel',
      address: '0xfdd48e7ca4391a0f9a3',
      avatar: 'whale',
      bgColor: const Color(
        0xFFFB7DC1,
      ),
    ),
    FavoritesModel(
      name: 'Manuel',
      address: 'Fjdd48e7ca4391a0f9a3',
      avatar: 'fox',
      bgColor: const Color(
        0xFF21B2AA,
      ),
    ),
    FavoritesModel(
      name: 'Manuel',
      address: 'PWfdd48e7ca4391a0f9a3',
      avatar: 'dinosaur',
      bgColor: const Color(
        0xFF9A00D0,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.86,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(27),
        vertical: getProportionateScreenHeight(20),
      ),
      decoration: const BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Text(
            'Send Tokens',
            style: textStyle.copyWith(
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(17),
          ),
          Container(
            height: getProportionateScreenHeight(50),
            decoration: BoxDecoration(
              color: const Color(0xFF23253B),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
                vertical: getProportionateScreenHeight(9),
              ),
              child: Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(32),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/profile.png',
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(17),
                  ),
                  Text(
                    'Lincoin Gakuya',
                    style: textStyle.copyWith(
                      fontSize: getProportionateScreenHeight(16),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    MdiIcons.chevronDown,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Container(
            height: getProportionateScreenHeight(149),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF23253B),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To',
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(42),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    // vertical: getProportionateScreenHeight(10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                    color: const Color(0xFF313451),
                  ),
                  child: TextFormField(
                    controller: controller.addressController,
                    style: textStyle,
                    cursorColor: kPrimaryColor,
                    cursorHeight: getProportionateScreenHeight(15),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Scan, search or enter address',
                      hintStyle: textStyle.copyWith(
                        color: const Color(0xFFDDDEED),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          final result = await Get.to(() => const ScanQRCode());
                          if (result != null) {
                            controller.addressController.text =
                                result.toString();
                          } else {
                            showToast("Didn't scan anything");
                          }
                        },
                        child: Icon(
                          MdiIcons.lineScan,
                          color: Colors.white,
                          size: getProportionateScreenHeight(16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Transfer between my accounts',
                      style: textStyle.copyWith(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Favorites/ Frequents',
                textAlign: TextAlign.left,
                style: textStyle.copyWith(
                  fontSize: getProportionateScreenHeight(16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _favsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.addressController.text =
                        _favsList[index].address;
                  },
                  child: Container(
                    height: getProportionateScreenHeight(85),
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(15),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(8),
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF25273A),
                          Color(0xFF2E314D),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(52),
                          width: getProportionateScreenWidth(52),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _favsList[index].bgColor,
                          ),
                          child: Image.asset(
                            'assets/icons/${_favsList[index].avatar}.png',
                            height: getProportionateScreenHeight(24),
                            width: getProportionateScreenWidth(24),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(17),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _favsList[index].name,
                              style: textStyle.copyWith(
                                fontSize: getProportionateScreenHeight(16),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              _favsList[index].address,
                              style: textStyle.copyWith(
                                color: const Color(0xFFA3A7C5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
