class User {
  UserInfo user;
  String? accessToken;

  User({required this.user, required this.accessToken});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        user: UserInfo.fromJson(json["user"]),
        accessToken: json["accessToken"] as String);
  }
}

class UserInfo {
  String? userID;
  String? userType;
  String? balance;
  String? email;

  UserInfo(
      {required this.userID,
      required this.userType,
      required this.balance,
      required this.email});

  factory UserInfo.fromJson(Map<dynamic, dynamic> json) {
    return UserInfo(
      userID: json["userID"] as String,
      userType: json["userType"] as String,
      balance: json["balance"] ?? "0",
      email: json["email"] as String,
    );
  }
}
