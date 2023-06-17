import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/models/storage/user.dart';

abstract class UserAppStorageInterface {
  Future<bool> saveUserDetails(
      {required UserAppStorageModel userAppStorageModel});

  Future<UserAppStorageResponse> getUserData();

  Future clearUserData();

  Future<String> getAccessToken();
  Future<String> getRefreshToken();
  Future updateTokens(
      {required String accessToken, required String refreshToken});
}
