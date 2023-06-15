import 'package:myshop/data/models/storage/user.dart';

abstract class UserAppStorageInterface {
  Future<bool> saveUserDetails(
      {required UserAppStorageModel userAppStorageModel});

      
}
