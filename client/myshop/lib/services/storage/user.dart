import 'package:myshop/data/interfaces/storage/user.dart';
import 'package:myshop/data/models/storage/user.dart';
import 'package:myshop/managers/storage_keys.dart';
import 'package:myshop/services/storage/app.dart';

class UserAppStorage implements UserAppStorageInterface {
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

    // final userNameWriteRes = await _appStorageService.writeData(
    //     key: AppStorageKeys.userName, data: userAppStorageModel.userName);

    // return await userNameWriteRes.fold((l) {
    //   return false;
    // }, (r) async {
    //   final accessTokenWriteRes = await _appStorageService.writeData(
    //       key: AppStorageKeys.accessToken,
    //       data: userAppStorageModel.accessToken);
    //   return await accessTokenWriteRes.fold((l) {
    //     return false;
    //   }, (r) async {
    //     final refreshTokenWriteRes = await _appStorageService.writeData(
    //         key: AppStorageKeys.refreshToken,
    //         data: userAppStorageModel.refreshToken);
    //     return refreshTokenWriteRes.fold((l) => false, (r) => true);
    //   });
    // });
  }
}
