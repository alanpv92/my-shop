import 'package:myshop/data/models/authentication%20data/base.dart';

class RegistrationAuthenticationModel extends BaseAuthenticationDataModel {
  final String userName;
  RegistrationAuthenticationModel(
      {required this.userName, required String email, required String password})
      : super(email: email, password: password);

  toMap() => {'email': email, 'password': password, 'user_name': userName};
}
