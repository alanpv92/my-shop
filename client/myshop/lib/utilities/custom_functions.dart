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

  Future<AppNetworkResponse> networkTryCatchUsingDio(
      Function dioFunction) async {
    try {
      final Map<String, dynamic> responeseData = await dioFunction();
      log("response data is $responeseData");

      return right(responeseData['data']);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return left(AppNetworkException(
            message: e.response!.data['message'],
            statusCode: e.response!.statusCode ?? 500));
      }


      return left(AppNetworkException(
          message: TextManger.instance.unKnownError, statusCode: 500));
    } catch (e) {
      log("random error is being called ");
      return left(AppNetworkException(
          message: TextManger.instance.unKnownError, statusCode: 500));
    }
  }
}
