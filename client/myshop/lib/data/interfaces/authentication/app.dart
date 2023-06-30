import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/data/models/authentication%20data/registration.dart';

import '../../models/authentication data/base.dart';
import '../../models/authentication data/otp_verification.dart';

abstract class AppAuthenticationInterface {
  Future<AppAuthenticationResponse> loginUser(
      {required LoginAuthenticationDataModel loginAuthenticationDataModel});
  Future<AppAuthenticationResponse> registerUser(
      {required RegistrationAuthenticationModel
          registrationAuthenticationModel});
  Future logOut();
  Future<AppAuthenticationRefreshTokensResponse> refreshToken();

  Future<AppPasswordResetResponse> requestOtp(
      {required BaseAuthenticationDataModel baseAuthenticationDataModel});
  Future<AppPasswordResetResponse> verifyOtp(
      {required OtpVerificationModel otpVerificationModel});
}
