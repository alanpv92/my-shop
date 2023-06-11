import 'package:myshop/data/models/authentication%20data/base.dart';

class LoginAuthenticationDataModel extends BaseAuthenticationDataModel {
  LoginAuthenticationDataModel(
      {required String email, required String password})
      : super(email: email, password: password);

  toMap() => {'email': email, 'password': password};
}
