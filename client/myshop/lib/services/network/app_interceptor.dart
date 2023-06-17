import 'dart:developer';

import 'package:dio/dio.dart';

class AppNetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == 'auth/login' || options.path == 'auth/register') {
      super.onRequest(options, handler);
    }
    
    super.onRequest(options, handler);
  }
}
