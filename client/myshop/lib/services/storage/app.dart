import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/exceptions/app.dart';
import 'package:myshop/data/interfaces/storage/app.dart';
import 'package:myshop/managers/text.dart';

class AppStorageService implements AppStorageInterface {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();
  @override
  Future<AppStorageResponse> deleteData({required String key}) async {
    try {
      await _flutterSecureStorage.delete(key: key);
      return right(null);
    } on PlatformException catch (_) {
      return left(AppException(TextManger.instance.unKnownError));
    } catch (e) {
      return left(AppException(TextManger.instance.unKnownError));
    }
  }

  @override
  Future<AppStorageResponse> getData({required String key}) async {
    try {
      final data = await _flutterSecureStorage.read(key: key);
      return right(data);
    } on PlatformException catch (_) {
      return left(AppException(TextManger.instance.unKnownError));
    } catch (_) {
      return left(AppException(TextManger.instance.unKnownError));
    }
  }

  @override
  Future<AppStorageResponse> writeData(
      {required String key, required String data}) async {
    try {
      await _flutterSecureStorage.write(key: key, value: data);
      return right(null);
    } on PlatformException catch (_) {
      return left(AppException(TextManger.instance.unKnownError));
    } catch (_) {
      return left(AppException(TextManger.instance.unKnownError));
    }
  }
}
