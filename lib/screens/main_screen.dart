import 'package:flutter/cupertino.dart';
import 'package:gema_mobile/screens/notification/notification_screen.dart';
import 'package:gema_mobile/screens/swap/swap_screen.dart';
import 'package:gema_mobile/screens/settings/settings_screen.dart';
import 'package:gema_mobile/screens/wallet/wallet_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatefulWidget {
  final int? currIndex;
  const MainScreen({
    this.currIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Removing manual controller as it's often handled internally or requires specific v2 types

  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: const WalletScreen(),
        item: ItemConfig(
          icon: Icon(MdiIcons.walletOutline),
          title: "Wallet",
          activeForegroundColor: kPrimaryColor,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const SendScreen(),
        item: ItemConfig(
          icon: Icon(MdiIcons.swapVertical),
          title: "Swap",
          activeForegroundColor: kPrimaryColor,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const NotificationScreen(),
        item: ItemConfig(
          icon: Icon(MdiIcons.bellOutline),
          title: "Notification",
          activeForegroundColor: kPrimaryColor,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const SettingsScreen(),
        item: ItemConfig(
          icon: Icon(MdiIcons.cogOutline),
          title: "Settings",
          activeForegroundColor: kPrimaryColor,
          inactiveForegroundColor: CupertinoColors.systemGrey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
