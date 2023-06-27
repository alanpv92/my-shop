class BaseAuthenticationDataModel {
  final String email;
  final String password;
  BaseAuthenticationDataModel({required this.email, required this.password});

  String getEmail() => email;
  String getPassword() => password;

 Map<String,String> getEmailMap() => {'email': email};
}
