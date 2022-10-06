import 'package:gema_mobile/screens/authentication/login/models/user_model.dart';
import 'package:gema_mobile/screens/wallet/service/my_tokens_service.dart';
import 'package:get/get.dart';

class WalletScreenController extends GetxController {
  final _mytknService = MyTokenService();

  // user info
  UserClass? userInfo;
  @override
  void onInit() async {
    await fetchUserInfo();
    super.onInit();
  }

  fetchUserInfo() async {
    var res = await _mytknService.fetchUserInfo();
    if (res != null) {
      userInfo = res;
      update();
    }
  }
}
