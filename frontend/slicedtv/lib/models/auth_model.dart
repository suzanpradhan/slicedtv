class AuthModel {
  String username;
  String email;
  String password;
  String confirmPassword;

  AuthModel({this.username, this.email, this.password, this.confirmPassword});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(username: json["username"], email: json["email"]);
  }

  Map<String, dynamic> toJson() => {
        "username": this.username ?? "",
        "email": this.email ?? "",
        "password": this.password
      };
}
