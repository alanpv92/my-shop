import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:myshop/data/models/authentication%20data/base.dart';

import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/data/models/authentication%20data/otp_verification.dart';
import 'package:myshop/data/models/authentication%20data/registration.dart';
import 'package:myshop/data/models/storage/user.dart';

import 'package:myshop/managers/text.dart';
import 'package:myshop/services/authentication/app.dart';
import 'package:myshop/services/storage/user.dart';
import 'package:myshop/ui/screen/authentication/otp_screen.dart';

import 'package:myshop/utilities/error_toast.dart';
import 'package:myshop/utilities/sucess_toast.dart';

final authControllerProvider =
    StateNotifierProvider<AuthenticationNotifer, AuthenticationState>(
        (ref) => AuthenticationNotifer());

class AuthenticationState {
  final bool isLoading;
  final bool isAuthenticated;
  AuthenticationState({required this.isAuthenticated, required this.isLoading});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AuthenticationState &&
        other.isLoading == isLoading &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode => Object.hashAll([isLoading, isAuthenticated]);

  AuthenticationState copyWith({bool? isLoading, bool? isAuthenticated}) {
    return AuthenticationState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        isLoading: isLoading ?? this.isLoading);
  }
}

class AuthenticationNotifer extends StateNotifier<AuthenticationState> {
  AuthenticationNotifer()
      : super(AuthenticationState(isAuthenticated: false, isLoading: false));

  final AppAuthenticationService _appAuthenticationService =
      AppAuthenticationService.instance;

  final UserAppStorageService _userAppStorageService = UserAppStorageService();

  Future loginUser(
      LoginAuthenticationDataModel loginAuthenticationDataModel) async {
    state = state.copyWith(isLoading: true);
    final authResponse = await _appAuthenticationService.loginUser(
        loginAuthenticationDataModel: loginAuthenticationDataModel);
    await authResponse.fold((l) {
      ErrorToast(l.message).showError();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }, (usermodel) async {
      await _userAppStorageService.saveUserDetails(
          userAppStorageModel: UserAppStorageModel(
              accessToken: usermodel.accessToken,
              refreshToken: usermodel.refreshToken,
              userName: usermodel.userName));
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    });
  }

  Future registerUser(
      RegistrationAuthenticationModel registrationAuthenticationModel) async {
    state = state.copyWith(isLoading: true);
    final authResponse = await _appAuthenticationService.registerUser(
        registrationAuthenticationModel: registrationAuthenticationModel);

    await authResponse.fold((l) {
      ErrorToast(l.message).showError();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }, (usermodel) async {
      await _userAppStorageService.saveUserDetails(
          userAppStorageModel: UserAppStorageModel(
              accessToken: usermodel.accessToken,
              refreshToken: usermodel.refreshToken,
              userName: usermodel.userName));
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    });
  }

  Future logOut() async {
    await _userAppStorageService.clearUserData();
    state = state.copyWith(isLoading: false, isAuthenticated: false);
  }

  void authenticateUser() {
    state = AuthenticationState(isAuthenticated: true, isLoading: false);
  }

  Future refreshToken() async {
    final tokenRefreshResponse = await _appAuthenticationService.refreshToken();

    await tokenRefreshResponse.fold((l) async {
      await logOut();
    }, (r) {
      _userAppStorageService.updateTokens(
          accessToken: r[0], refreshToken: r[1]);
      state = state.copyWith(isAuthenticated: true);
    });
  }

  Future requestOtp(
      {required BaseAuthenticationDataModel
          baseAuthenticationDataModel}) async {
    state = state.copyWith(isAuthenticated: false, isLoading: true);
    final requestOtpResult = await _appAuthenticationService.requestOtp(
        baseAuthenticationDataModel: baseAuthenticationDataModel);
    requestOtpResult.fold((l) {
      ErrorToast(l.message).showError();
      state = state.copyWith(isLoading: false, isAuthenticated: false);
    }, (r) {
      state = state.copyWith(isLoading: false, isAuthenticated: false);
      Get.to(() => OtpVerificationScreen(
            baseAuthenticationDataModel: baseAuthenticationDataModel,
          ));
    });
  }

  Future verifyOtp({required OtpVerificationModel otpVerificationModel}) async {
    state = state.copyWith(isLoading: true, isAuthenticated: false);
    log(otpVerificationModel.toMap().toString());
    final response = await _appAuthenticationService.verifyOtp(
        otpVerificationModel: otpVerificationModel);
    response.fold((l) {
      ErrorToast(l.message).showError();
      state = state.copyWith(isLoading: false, isAuthenticated: false);
    }, (r) async {
      SucessToast(TextManger.instance.passwordChangedSucess).showSucess();

      Get.back();
      Get.back();

      await loginUser(LoginAuthenticationDataModel(
          email: otpVerificationModel.email,
          password: otpVerificationModel.password));
    });
  }
}
