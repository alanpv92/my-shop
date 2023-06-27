mixin CommonText {
  final String appName = "My Shop";
}

mixin ValidationText {
  final String formEmptyValidation = "This Field Cannot Be Empty";
}

mixin NetworkErrorText {
  final String unKnownError = 'something went wrong';
}

mixin AuthText {
  final String register = "Register";
  final String login = "Login";
  final String loginRedirect = 'Already Have An Account?';
  final String registerRedirect = "Dont Have an Account?";

  final String userNameHint = 'User Name';
  final String passwordHint = 'Password';
  final String emailHint = 'Email';

  final String resetPassword = "Reset Password";

  final String requestOpt = 'request otp';

  final String verifyOtp = 'Verify your Otp';
  final String otpSendEmail = 'Otp has been send to';
  final String otpExpireMessage = 'Otp will expire in 2 minutes';
}

mixin AppStorageText {
  final String notPresenet = 'Data Is Not Found';
}

class TextManger
    with
        AuthText,
        CommonText,
        ValidationText,
        NetworkErrorText,
        AppStorageText {
  TextManger._();
  static TextManger instance = TextManger._();
  factory TextManger() => instance;
}
