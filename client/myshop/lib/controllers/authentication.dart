import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/data/models/authentication%20data/registration.dart';
import 'package:myshop/services/authentication/app.dart';
import 'package:myshop/utilities/error_toast.dart';

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

  Future loginUser(
      LoginAuthenticationDataModel loginAuthenticationDataModel) async {
    state = state.copyWith(isLoading: true);
    final authResponse = await _appAuthenticationService.loginUser(
        loginAuthenticationDataModel: loginAuthenticationDataModel);
    authResponse.fold((l) {
      ErrorToast(l.message).showError();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }, (r) {
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    });
  }

  Future registerUser(
      RegistrationAuthenticationModel registrationAuthenticationModel) async {
    state = state.copyWith(isLoading: true);
    final authResponse = await _appAuthenticationService.registerUser(
        registrationAuthenticationModel: registrationAuthenticationModel);

    authResponse.fold((l) {
          ErrorToast(l.message).showError();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }, (r) {
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    });
  }

  Future logOut() async {}
}
