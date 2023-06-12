import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/exceptions/network.dart';
import 'package:myshop/managers/text.dart';

class CustomFunctions {
  CustomFunctions._();
  static CustomFunctions instance = CustomFunctions._();
  factory CustomFunctions() => instance;

  Future<AppNetworkResponse>  networkTryCatchUsingDio(
      Function dioFunction) async {
    try {
      final Map<String, dynamic> responeseData = await dioFunction();
      log("response data is $responeseData");
        
      return right(responeseData['data']);
    } on DioException catch (e) {
      log('dio error is being called');
      log(e.response?.data);
      return left(AppNetworkException(
          message: TextManger.instance.unKnownError, statusCode: 500));
    } catch (e) {
      log("random error is being called ");
      return left(AppNetworkException(
          message: TextManger.instance.unKnownError, statusCode: 500));
    }
  }
}
