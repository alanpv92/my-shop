class UserAppStorageModel {
  final String userName;
  final String accessToken;
  final String refreshToken;
  UserAppStorageModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.userName});
}
