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
}

mixin AppStorageText {
  final String notPresenet = 'Data Is Not Found';
}

class TextManger with AuthText, CommonText, ValidationText, NetworkErrorText,AppStorageText {
  TextManger._();
  static TextManger instance = TextManger._();
  factory TextManger() => instance;
}
