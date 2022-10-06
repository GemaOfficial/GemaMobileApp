import 'package:gema_mobile/controllers/wallet_controller.dart';
import 'package:gema_mobile/screens/authentication/login/controller/controller.dart';
import 'package:gema_mobile/screens/authentication/register/controller/controller.dart';
import 'package:gema_mobile/screens/authentication/reset/controller/controller.dart';
import 'package:gema_mobile/screens/settings/controller/settings_controller.dart';
import 'package:gema_mobile/screens/wallet/controller/wallet_controller.dart';
import 'package:get/get.dart';

class WalletBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ForgotController());
    Get.lazyPut(() => ResetController());
    Get.lazyPut(() => WalletScreenController());
  }
}
