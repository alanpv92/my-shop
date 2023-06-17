import 'package:get/route_manager.dart';
import 'package:myshop/ui/screen/authentication.dart';
import 'package:myshop/ui/screen/dash.dart';

class Routes {
  static String authenticationScreen = '/authentication';
  static String dashScreen = '/dashscreen';
}

class RouterManger {
  static List<GetPage<dynamic>>? getAllPages() {
    return [
      GetPage(name: Routes.authenticationScreen, page: () =>const AuthenticationScreen(),),
      GetPage(name: Routes.dashScreen, page: () => const Dash(),)
    ];
  }
}
