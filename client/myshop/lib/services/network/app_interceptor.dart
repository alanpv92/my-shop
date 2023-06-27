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
      options.headers['Authorization'] = 'Bearer $acessToken';
    }

    return super.onRequest(options, handler);
  }
}
