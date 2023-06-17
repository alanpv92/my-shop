import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/exceptions/app.dart';
import 'package:myshop/data/interfaces/storage/user.dart';
import 'package:myshop/data/models/storage/user.dart';
import 'package:myshop/managers/storage_keys.dart';
import 'package:myshop/managers/text.dart';
import 'package:myshop/services/storage/app.dart';

class UserAppStorageService implements UserAppStorageInterface {
  UserAppStorageService._();
  static UserAppStorageService instance = UserAppStorageService._();
  factory UserAppStorageService() => instance;
  final AppStorageService _appStorageService = AppStorageService();
  @override
  Future<bool> saveUserDetails(
      {required UserAppStorageModel userAppStorageModel}) async {
    await _appStorageService.writeData(
        key: AppStorageKeys.accessToken, data: userAppStorageModel.accessToken);
    await _appStorageService.writeData(
        key: AppStorageKeys.refreshToken,
        data: userAppStorageModel.refreshToken);
    await _appStorageService.writeData(
        key: AppStorageKeys.userName, data: userAppStorageModel.userName);
    return true;
  }

  @override
  Future clearUserData() async {
    await _appStorageService.deleteData(key: AppStorageKeys.accessToken);
    await _appStorageService.deleteData(key: AppStorageKeys.refreshToken);
    await _appStorageService.deleteData(key: AppStorageKeys.userName);
  }

  @override
  Future<UserAppStorageResponse> getUserData() async {
    final accessTokenReadResponse =
        await _appStorageService.getData(key: AppStorageKeys.accessToken);
    
    return await accessTokenReadResponse.fold((l) {
      return left(l);
    }, (accessToken) async {
      final refreshTokenReadResponse =
          await _appStorageService.getData(key: AppStorageKeys.refreshToken);
      return await refreshTokenReadResponse.fold((l) {
        return left(l);
      }, (refreshToken) async {
        final userNameReadResponse =
            await _appStorageService.getData(key: AppStorageKeys.userName);
        return userNameReadResponse.fold((l) {
          return left(l);
        }, (userName) {
          return right(UserAppStorageModel(
              accessToken: accessToken!,
              refreshToken: refreshToken!,
              userName: userName!));
        });
      });
    });
  }

  @override
  Future<String> getAccessToken() async {
    final accessToken =
        await _appStorageService.getData(key: AppStorageKeys.accessToken);
    return accessToken.fold((l) {
      return '';
    }, (r) {
      return r!;
    });
  }

  @override
  Future<String> getRefreshToken() async {
    final accessToken =
        await _appStorageService.getData(key: AppStorageKeys.refreshToken);
    return accessToken.fold((l) {
      return '';
    }, (r) {
      return r!;
    });
  }

  @override
  Future updateTokens(
      {required String accessToken, required String refreshToken}) async {
    await _appStorageService.writeData(
        key: AppStorageKeys.accessToken, data: accessToken);
    await _appStorageService.writeData(
        key: AppStorageKeys.refreshToken, data: refreshToken);
  }
}
