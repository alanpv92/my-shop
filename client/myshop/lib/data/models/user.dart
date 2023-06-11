class UserModel {
  final int id;
  final String email;
  final String userName;

  UserModel({required this.email, required this.id, required this.userName});

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
      email: data['email'], id: data['id'], userName: data['user_name']);

      

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.userName == userName;
  }

  @override
  int get hashCode => Object.hashAll([id, email, userName]);
}
