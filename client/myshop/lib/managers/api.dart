import 'dart:io';

class ApiManager {
  static String baseURL =
      Platform.isIOS ? 'http://127.0.0.1:3000/' : 'http://10.1.104.199:3000/';
}

class ApiPath {
  static String authRegistrationPath = 'auth/register';
  static String authLoginPath = 'auth/login';
  static String authRefreshTokenPath = 'auth/refresh';
  static String authRequestOtpPath = 'auth//reset';
  static String authVerifyOtpPath = 'auth/verify-password-otp';
}
