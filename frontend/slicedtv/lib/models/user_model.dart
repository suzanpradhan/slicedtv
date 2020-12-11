class UserModel {
  final int userID;
  final String username;
  final String email;

  UserModel({this.email, this.userID, this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"], userID: json["id"], username: json["username"]);
  }
}
