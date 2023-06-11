import 'dart:io';

class ApiManager {
  static String baseURL =
      Platform.isIOS ? 'http://127.0.0.1:3000/' : 'http://10.1.104.199:3000/';
}

class ApiPath {
  static String authRegistrationPath = '${ApiManager.baseURL}auth/registration';
  static String authLoginPath = '${ApiManager.baseURL}auth/login';
}
