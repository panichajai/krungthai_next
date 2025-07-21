class SignupModel {
  String email;
  String username;
  String password;

  SignupModel({
    required this.email,
    required this.username,
    required this.password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
