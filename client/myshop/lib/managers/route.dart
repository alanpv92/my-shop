import 'package:get/route_manager.dart';
import 'package:myshop/ui/screen/authentication/authentication.dart';
import 'package:myshop/ui/screen/dash.dart';
import 'package:myshop/ui/screen/authentication/reset_password.dart';

class Routes {
  static String authenticationScreen = '/authentication';
  static String dashScreen = '/dashscreen';
  static String resetPasswordScreen = '/resetPassword';
}

class RouterManger {
  static List<GetPage<dynamic>>? getAllPages() {
    return [
      GetPage(
        name: Routes.authenticationScreen,
        page: () => const AuthenticationScreen(),
      ),
      GetPage(
        name: Routes.dashScreen,
        page: () => const Dash(),
      ),
      GetPage(name: Routes.resetPasswordScreen, page: () => const ResetPasswordScreen(),)
    ];
  }
}
