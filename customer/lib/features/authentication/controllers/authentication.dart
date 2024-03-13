import 'package:customer/common_export.dart';

class AuthenticationController extends ChangeNotifier {
  AuthModes _authModes = AuthModes.login;

  AuthModes get authMode => _authModes;
  
  bool get isSignUpMode => _authModes==AuthModes.signUp;

  void toggleAuthMode() {
    if (_authModes == AuthModes.login) {
      _authModes = AuthModes.signUp;
    } else {
      _authModes = AuthModes.login;
    }
    notifyListeners();
  }
}
