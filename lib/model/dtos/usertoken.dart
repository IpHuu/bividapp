class UserToken {
  UserToken(this.userid, this.userName, this.userFullName, this.email,
      this.refreshToken) {
    tokenId = "";
  }
  String userid;
  String userName;
  String userFullName;
  String email;
  String refreshToken;
  DateTime? validaty;
  DateTime? expireTime;
  late String tokenId;

  factory UserToken.fromMap(Map<String, dynamic> json) {
    UserToken user = UserToken(json['userId'], json['userName'],
        json['userFullName'], json['email'], json['refreshToken']);
    user.tokenId = json["tokenId"];
    user.expireTime = DateTime.parse(json['expiredTime']);
    user.validaty = DateTime.parse(json['expiredTime']);
    return user;
  }
  Map<String, dynamic> toMap() {
    return {
      "userId": userid,
      "userName": userName,
      "userFullName": userFullName,
      "email": email,
      "refreshToken": refreshToken,
      "tokenId": tokenId,
      "expiredTime": expireTime != null ? expireTime.toString() : expireTime,
      "validaty": validaty != null ? validaty.toString() : validaty,
    };
  }

  factory UserToken.empty() {
    var user = UserToken("", "", "", "", "");
    user.tokenId = "";
    return user;
  }
  void copyFrom(UserToken user) {
    email = user.email;
    expireTime = user.expireTime;
    refreshToken = user.refreshToken;
    tokenId = user.tokenId;
    userFullName = user.userFullName;
    userName = user.userName;
    userid = user.userid;
  }
}
