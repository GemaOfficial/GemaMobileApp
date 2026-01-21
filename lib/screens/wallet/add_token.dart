import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/constants.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddTokenScreen extends StatefulWidget {
  const AddTokenScreen({super.key});

  @override
  State<AddTokenScreen> createState() => _AddTokenScreenState();
}

class _AddTokenScreenState extends State<AddTokenScreen> {
  final Map<String, dynamic> _tokenList = {
    'Bitcoin': 'BTC',
    'Ethereum': 'ETH',
    'Cardano': 'CRD',
    'Tether': 'TTR',
    'LiteCoin': 'LTH',
  };

  final List<IconData> _icons = [
    MdiIcons.bitcoin,
    MdiIcons.ethereum,
    MdiIcons.litecoin,
    MdiIcons.bitcoin,
    MdiIcons.ethereum,
  ];
  final List<Color> _colors = [
    const Color(0xFFF7931A),
    const Color(0xFF00A9E0),
    const Color(0xFF00A9E0),
    const Color(0xFF00A9E0),
    const Color(0xFFFB2EA3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            MdiIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Add assets',
          style: textStyle.copyWith(
            fontSize: getProportionateScreenHeight(16),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            top: getProportionateScreenWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getProportionateScreenHeight(51),
                padding: EdgeInsets.all(
                  getProportionateScreenHeight(14),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF23253B),
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenHeight(12),
                  ),
                ),
                child: TextFormField(
                  cursorColor: kPrimaryColor,
                  cursorHeight: getProportionateScreenHeight(15),
                  style: textStyle.copyWith(
                    fontSize: getProportionateScreenHeight(12),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: textStyle.copyWith(
                      fontSize: getProportionateScreenHeight(14),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    prefixIcon: Icon(
                      MdiIcons.magnify,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              const Text(
                'Select tokens',
                textAlign: TextAlign.left,
                style: textStyle,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tokenList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AddTokenWidget(
                      _tokenList.keys.toList()[index],
                      _tokenList.values.toList()[index],
                      _icons[index],
                      iconColor: _colors[index],
                    );
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: getProportionateScreenHeight(46),
                    width: getProportionateScreenWidth(165),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenHeight(8),
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(kPrimaryColor),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      EasyLoading.show(status: 'Adding token..');
                      Future.delayed(const Duration(seconds: 3),
                          () => EasyLoading.dismiss());
                    },
                    child: Container(
                      height: getProportionateScreenHeight(46),
                      width: getProportionateScreenWidth(165),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(8),
                        ),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        'Add tokens',
                        style: TextStyle(
                          color: Color(0xFF26283B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTokenWidget extends StatelessWidget {
  final String tokenName;
  final String symbol;
  final IconData icon;
  final Color iconColor;
  const AddTokenWidget(
    this.tokenName,
    this.symbol,
    this.icon, {
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(35),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: getProportionateScreenHeight(24),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          RichText(
            text: TextSpan(
              text: tokenName,
              style: textStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
              ),
              children: [
                TextSpan(
                  text: ' $symbol',
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
    );
  }
}
