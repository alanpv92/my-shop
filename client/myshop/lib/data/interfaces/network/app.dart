import 'package:myshop/data/custom%20types/types.dart';

abstract class AppNetworkInterface {
  Future<AppNetworkResponse> get({Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> post({Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> patch({Map<String, dynamic> data = const {}});
  Future<AppNetworkResponse> delete({Map<String, dynamic> data = const {}});
}
