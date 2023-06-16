import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/interfaces/authentication/app.dart';
import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/data/models/authentication%20data/registration.dart';
import 'package:myshop/data/models/user.dart';
import 'package:myshop/managers/api.dart';
import 'package:myshop/services/network/app.dart';

class AppAuthenticationService implements AppAuthenticationInterface {
  AppAuthenticationService._();
  static AppAuthenticationService instance = AppAuthenticationService._();
  factory AppAuthenticationService() => instance;

  final AppNetworkService _appNetworkService = AppNetworkService.instance;
  @override
  Future logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<AppAuthenticationResponse> loginUser(
      {required LoginAuthenticationDataModel
          loginAuthenticationDataModel}) async {
    final response = await _appNetworkService.post(
        path: ApiPath.authLoginPath,
        data: loginAuthenticationDataModel.toMap());
    return response.fold((l) {
      return left(l);
    }, (r) {
      log(r.toString());
      return right(UserModel.fromMap(r));
    });
  }

  @override
  Future<AppAuthenticationResponse> registerUser(
      {required RegistrationAuthenticationModel
          registrationAuthenticationModel}) async {
    final response = await _appNetworkService.post(
        path: ApiPath.authRegistrationPath,
        data: registrationAuthenticationModel.toMap());

    return response.fold((l) {
      return left(l);
    }, (r) => right(UserModel.fromMap(r)));
  }
}
