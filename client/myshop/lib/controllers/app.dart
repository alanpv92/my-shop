import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/controllers/authentication.dart';
import 'package:myshop/data/models/storage/user.dart';
import 'package:myshop/services/storage/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final appControllerProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  final authenticatonNotifer = ref.read(authControllerProvider.notifier);
  return AppStateNotifier(authenticationNotifer: authenticatonNotifer);
});

class AppState {
  bool isLoading;
  UserAppStorageModel? userAppStorageModel;
  AppState({required this.isLoading, this.userAppStorageModel});

  AppState copywith(
      {bool? isLoading, UserAppStorageModel? userAppStorageModel}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        userAppStorageModel: userAppStorageModel ?? this.userAppStorageModel);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AppState &&
        other.isLoading == isLoading &&
        other.userAppStorageModel == userAppStorageModel;
  }

  @override
  int get hashCode => Object.hashAll([isLoading, userAppStorageModel]);
}

class AppStateNotifier extends StateNotifier<AppState> {
  final AuthenticationNotifer _authenticationNotifer;
  AppStateNotifier({required AuthenticationNotifer authenticationNotifer})
      : _authenticationNotifer = authenticationNotifer,
        super(AppState(isLoading: true));

  final UserAppStorageService _userAppStorageService = UserAppStorageService();

  loadAppData() async {
    final userAppStorageRes = await _userAppStorageService.getUserData();
    await userAppStorageRes.fold((l) {
      //critical error force quit application
      log('storage error');
    }, (userAppStorageModel) async {
      final isAcessTokenIsExpired =
          JwtDecoder.isExpired(userAppStorageModel.accessToken);
      if (isAcessTokenIsExpired) {
        final isRefreshTokenIsExpired =
            JwtDecoder.isExpired(userAppStorageModel.refreshToken);
        if (isRefreshTokenIsExpired) {
          await _authenticationNotifer.logOut();
        } else {
          await _authenticationNotifer.refreshToken();
        }
      } else {
        state = state.copywith(
            isLoading: false, userAppStorageModel: userAppStorageModel);
        _authenticationNotifer.authenticateUser();
      }
    });
  }
}
