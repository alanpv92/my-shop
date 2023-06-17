import 'package:myshop/data/custom%20types/types.dart';
import 'package:myshop/data/models/authentication%20data/login.dart';
import 'package:myshop/data/models/authentication%20data/registration.dart';

abstract class AppAuthenticationInterface {
  Future<AppAuthenticationResponse> loginUser(
      {required LoginAuthenticationDataModel loginAuthenticationDataModel});
  Future<AppAuthenticationResponse> registerUser(
      {required RegistrationAuthenticationModel
          registrationAuthenticationModel});
  Future logOut();
  Future refreshToken();
}
