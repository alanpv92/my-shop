class UserModel {
  final int id;
  final String email;
  final String userName;
  final String accessToken;
  final String refreshToken;

  UserModel(
      {required this.email,
      required this.id,
      required this.userName,
      required this.accessToken,
      required this.refreshToken});

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
      email: data['email'],
      id: data['id'],
      userName: data['user_name'],
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken']);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.userName == userName &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      Object.hashAll([id, email, userName, refreshToken, accessToken]);
}
