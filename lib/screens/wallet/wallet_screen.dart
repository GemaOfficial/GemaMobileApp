import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gema_mobile/di/wallet_bindings.dart';
import 'package:gema_mobile/screens/main_screen.dart';
import 'package:gema_mobile/screens/send/send_screen.dart';
import 'package:gema_mobile/screens/wallet/add_token.dart';
import 'package:gema_mobile/screens/wallet/controller/wallet_controller.dart';
import 'package:gema_mobile/screens/wallet/models/my_tokens.dart';
import 'package:gema_mobile/screens/wallet/search_delegate.dart';
import 'package:gema_mobile/screens/wallet/service/my_tokens_service.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:gema_mobile/widgets/buy_token_modal.dart';
import 'package:gema_mobile/widgets/receive_tokens.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // final bool _isSearching = false;
  @override
  void initState() {
    super.initState();
  }

  final _walletService = MyTokenService();

  final _mytknCtrl = Get.put(
    WalletScreenController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    log('username :::: ${_mytknCtrl.userInfo?.username}');
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        leading: IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: const Icon(Icons.search),
        ),
        title: Text(
          'My Wallet',
          style: textStyle.copyWith(
            fontSize: getProportionateScreenHeight(16),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.offAll(
                const MainScreen(
                  currIndex: 3,
                ),
                transition: Transition.rightToLeft,
                binding: WalletBindings(),
              );
            },
            child: Container(
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
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(17),
              right: getProportionateScreenWidth(17),
              bottom: getProportionateScreenHeight(17)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(229),
                width: getProportionateScreenWidth(342),
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(20),
                  bottom: getProportionateScreenHeight(20),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      kGradStart,
                      kGradMid,
                      kGradEnd,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder(
                        stream: _walletService.fetchMyTokens(),
                        builder:
                            (context, AsyncSnapshot<List<TokenInfo>> snapshot) {
                          List<TokenInfo>? tokens = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Text(
                                'Loading...',
                                style: textStyle.copyWith(
                                  fontSize: getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Zwodrei',
                                ),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                                  ConnectionState.active ||
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(child: Text('0 GEM'));
                            } else if (snapshot.hasData) {
                              return Text(
                                '${tokens![0].value} GEM',
                                style: textStyle.copyWith(
                                  fontSize: getProportionateScreenWidth(30),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Zwodrei',
                                ),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  '0 GEM',
                                  style: textStyle.copyWith(
                                    fontSize: getProportionateScreenWidth(30),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Zwodrei',
                                  ),
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: Text(
                                '0 GEM',
                                style: textStyle.copyWith(
                                  fontSize: getProportionateScreenWidth(30),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Zwodrei',
                                ),
                              ),
                            );
                          }
                        }),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    Container(
                      height: getProportionateScreenHeight(35),
                      width: getProportionateScreenWidth(177),
                      decoration: BoxDecoration(
                        color: const Color(0x151D2C4D),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '\$0',
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                          SizedBox(width: getProportionateScreenWidth(15)),
                          Image.asset(
                            'assets/icons/arrow_top.png',
                            width: getProportionateScreenWidth(20.5),
                            height: getProportionateScreenHeight(10),
                          ),
                          SizedBox(width: getProportionateScreenWidth(5)),
                          Text(
                            '0%',
                            style: textStyle.copyWith(
                              fontSize: getProportionateScreenWidth(12),
                              color: kGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WalletButton(
                          'Send',
                          MdiIcons.arrowTopRight,
                          onTap: () {
                            Get.to(
                              () => const SendScreen(),
                              binding: WalletBindings(),
                            );
                          },
                        ),
                        WalletButton(
                          'Buy',
                          MdiIcons.walletPlusOutline,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: kBgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                builder: (context) {
                                  return const BuyTokenModal();
                                });
                          },
                        ),
                        WalletButton(
                          'Receive',
                          MdiIcons.arrowBottomLeft,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: kBgColor,
                                builder: (context) {
                                  return ReceiveTokens(
                                    userName:
                                        "${_mytknCtrl.userInfo?.username}.gematest.testnet",
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My tokens',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Get.to(() => const AddTokenScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Add Tokens',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: getProportionateScreenWidth(14),
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: StreamBuilder<List<TokenInfo>>(
                    stream: _walletService.fetchMyTokens(),
                    builder:
                        (context, AsyncSnapshot<List<TokenInfo>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ));
                      } else if (snapshot.connectionState ==
                              ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Center(child: Text('Error'));
                        } else if (snapshot.hasData) {
                          List<TokenInfo>? tokens = snapshot.data;
                          return ListView.builder(
                            itemCount: tokens!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TokenWidget(
                                tokenName: tokens[index].name,
                                tokenSymbol: tokens[index].symbol,
                                tokenBalance: '${tokens[index].value}',
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'Empty data',
                              style: textStyle,
                            ),
                          );
                        }
                      } else {
                        return Center(
                          child: Text(
                            'State: ${snapshot.connectionState}',
                            style: textStyle,
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onTap;
  const WalletButton(
    this.label,
    this.icon, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            radius: getProportionateScreenHeight(10),
            child: Container(
              height: getProportionateScreenHeight(52),
              width: getProportionateScreenWidth(52),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(5)),
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}

class TokenWidget extends StatelessWidget {
  final String tokenName;
  final String tokenSymbol;
  final String tokenBalance;
  const TokenWidget({
    Key? key,
    required this.tokenName,
    required this.tokenSymbol,
    required this.tokenBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(14),
          vertical: getProportionateScreenHeight(15)),
      height: getProportionateScreenHeight(90),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(5),
        top: getProportionateScreenHeight(14),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/app_icon.svg",
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenWidth(20),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              RichText(
                text: TextSpan(
                  text: tokenName,
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                  children: [
                    TextSpan(
                      text: ' $tokenSymbol',
                      style: textStyle.copyWith(
                        color: const Color(0xFFA3A7C5),
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: tokenBalance,
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  children: [
                    TextSpan(
                      text: ' $tokenSymbol',
                      style: textStyle.copyWith(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              const Text(
                '\$0.00',
                textAlign: TextAlign.center,
                style: textStyle,
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/arrow_bottom.png',
                width: getProportionateScreenWidth(21),
                height: getProportionateScreenHeight(9),
              ),
              SizedBox(width: getProportionateScreenWidth(5)),
              Text(
                '0%',
                style: textStyle.copyWith(
                  fontSize: getProportionateScreenWidth(12),
                  color: kRedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
