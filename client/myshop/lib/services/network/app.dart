

import 'package:dio/dio.dart';
import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/interfaces/network/app.dart';
import 'package:myshop/utilities/custom_functions.dart';

class AppNetworkService implements AppNetworkInterface {
  AppNetworkService._();
  static AppNetworkService instance = AppNetworkService._();
  factory AppNetworkService() => instance;
  final Dio _dio = Dio();
  final CustomFunctions _customFunctions = CustomFunctions.instance;
  @override
  Future<AppNetworkResponse> delete(
      {required String path, Map<String, dynamic> data = const {}}) async {
    return await _customFunctions.networkTryCatchUsingDio(() async {
      final response = await _dio.delete(path, data: data);
      return response.data as Map<String, dynamic>;
    });
  }

  @override
  Future<AppNetworkResponse> get(
      {required String path, Map<String, dynamic> data = const {}}) async {
    return await _customFunctions.networkTryCatchUsingDio(() async {
      final response = await _dio.get(path, data: data);
      return response.data as Map<String, dynamic>;
    });
  }

  @override
  Future<AppNetworkResponse> patch(
      {required String path, Map<String, dynamic> data = const {}}) async {
    return await _customFunctions.networkTryCatchUsingDio(() async {
      final response = await _dio.patch(path, data: data);
      return response.data as Map<String, dynamic>;
    });
  }

  @override
  Future<AppNetworkResponse> post(
      {required String path, Map<String, dynamic> data = const {}}) async {
    return await _customFunctions.networkTryCatchUsingDio(() async {
      final response = await _dio.post(path, data: data);
      
      return response.data as Map<String, dynamic>;
    });
  }
}
