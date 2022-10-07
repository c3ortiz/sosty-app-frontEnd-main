class User {
  UserInfo user;
  String accessToken;

  User({required this.user, required this.accessToken});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        user: UserInfo.fromJson(json["user"]),
        accessToken: json["accessToken"] as String);
  }
}

class UserInfo {
  String userID;
  String userType;
  String balance;

  UserInfo(
      {required this.userID, required this.userType, required this.balance});

  factory UserInfo.fromJson(Map<dynamic, dynamic> json) {
    return UserInfo(
      userID: json["userID"] as String,
      userType: json["userType"] as String,
      balance: json["balance"] == null ? "0" : json["key1"],
    );
  }
}

// class User {
//   final UserInfo user;
//   final String accessToken;

//   User(this.user, this.accessToken);

//   User.fromJson(Map<String, dynamic> json)
//       : user = json['user'],
//         accessToken = json['accessToken'];

//   Map<String, dynamic> toJson() => {
//         'user': user,
//         'accessToken': accessToken,
//       };
// }

// class UserInfo {
//   String userID;
//   String userType;
//   int balance;

//   UserInfo(this.userID, this.userType, this.balance);

//   UserInfo.fromJson(Map<String, dynamic> json)
//       : userID = json['userID'],
//         userType = json['userType'],
//         balance = json['balance'];

//   Map<String, dynamic> toJson() => {
//         'userID': userID,
//         'userType': userType,
//         'balance': balance,
//       };
// }
