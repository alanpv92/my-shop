import 'package:myshop/data/custom%20types/types.dart';

abstract class AppStorageInterface {
  Future<AppStorageResponse> getData({required String key});
  Future<AppStorageResponse> writeData(
      {required String key, required String data});
  Future<AppStorageResponse> deleteData({required String key});
}
