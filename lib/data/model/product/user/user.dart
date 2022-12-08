class User {
  int id;
  String userName;
  String email;
  String accessToken;
  String refreshToken;

  User(
      {required this.id,
      required this.accessToken,
      required this.email,
      required this.refreshToken,
      required this.userName});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["username"],
        email: json["email"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = userName;
    data['email'] = email;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
