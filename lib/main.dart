import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gema_mobile/di/wallet_bindings.dart';
import 'package:gema_mobile/screens/splash/splash_screen.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:get/route_manager.dart';

void main() {
  if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  configureLoader();
  runApp(const MyApp());
}

configureLoader() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = kBgColor
    ..indicatorColor = kBgColor
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = kPrimaryColor
    ..maskColor = Colors.grey.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // getToLandingPage() async {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Get.to(const MainScreen());
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getToLandingPage();
    return GetMaterialApp(
      title: 'Gema Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Zwodrei",
      ),
      home: const SplashScreen(),
      initialBinding: WalletBindings(),
      builder: EasyLoading.init(),
    );
  }
}
