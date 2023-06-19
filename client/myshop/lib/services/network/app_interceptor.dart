import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:myshop/services/storage/user.dart';

class AppNetworkInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == 'auth/login' || options.path == 'auth/register') {
      return super.onRequest(options, handler);
    }
    if (options.path == 'auth/refresh') {
      final refreshToken =
          await UserAppStorageService.instance.getRefreshToken();
   

      options.headers['Authorization'] = 'Bearer $refreshToken';
    } else {
      final acessToken = await UserAppStorageService.instance.getAccessToken();
      //check if token is expired 
      //if token is expired check if rf token if it is expired logout else try refreshing if sucess continue with request else log out
      options.headers['Authorization'] = 'Bearer $acessToken';
    }

    return super.onRequest(options, handler);
  }
}
