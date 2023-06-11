import 'package:myshop/data/custom%20types/types.dart';

abstract class AppNetworkInterface {
  Future<AppNetworkResponse> get({required String path,Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> post({required String path,Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> patch({required String path,Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> delete({required String path,Map<String, dynamic> data = const {}});
}
