class UserAppStorageModel {
  final String userName;
  final String accessToken;
  final String refreshToken;
  UserAppStorageModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.userName});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is UserAppStorageModel &&
        other.userName == userName &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override

  int get hashCode => Object.hashAll([userName, accessToken, refreshToken]);
}
