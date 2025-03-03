class UserSettings {
  UserSettings({
    required this.fingerEnabled,
    required this.themeColor,
    required this.cachedUserCode,
    required this.cachedSecretCode,
    required this.rememberMe,
    required this.fingerUser,
    required this.fingerSecretCode,
    this.usingDevelopingUI = true,
  }) {
    //
  }
  late bool rememberMe;
  late bool fingerEnabled;
  late bool usingDevelopingUI = true;
  late int themeColor = 1;
  late String version;
  late String cachedUserCode;
  late String cachedSecretCode;
  late String fingerUser;
  late String fingerSecretCode;

  factory UserSettings.fromMap(Map<String, dynamic> json) {
    UserSettings user = UserSettings(
      fingerEnabled: json['fingerEnabled'] ?? false,
      themeColor: json['themeColor'],
      cachedUserCode: json["cachedUserCode"] ?? "",
      cachedSecretCode: json["cachedSecretCode"] ?? "",
      rememberMe: json["rememberMe"] == null
          ? false
          : json["rememberMe"].toString().parseBool(),
      fingerUser: json["fingerUser"] ?? "",
      fingerSecretCode: json["fingerSecretCode"] ?? "",
      usingDevelopingUI: json["usingDevelopingUI"] ?? true,
    );
    user.version = "v1.0";
    user.rememberMe = true;
    return user;
  }
  Map<String, dynamic> toMap() {
    return {
      "fingerEnabled": fingerEnabled,
      "themeColor": themeColor,
      "version": version,
      "cachedUserCode": cachedUserCode,
      "cachedSecretCode": cachedSecretCode,
      "rememberMe": rememberMe,
      "fingerUser": fingerUser,
      "fingerSecretCode": fingerSecretCode,
      "usingDevelopingUI": usingDevelopingUI,
    };
  }

  factory UserSettings.empty() {
    var setting = UserSettings(
      fingerEnabled: false,
      themeColor: 1,
      cachedUserCode: "",
      cachedSecretCode: "",
      rememberMe: false,
      fingerUser: "",
      fingerSecretCode: "",
      usingDevelopingUI: false,
    );
    setting.version = "v1.0";
    setting.rememberMe = true;
    setting.usingDevelopingUI = true;
    setting.themeColor = 1;

    return setting;
  }
  void copyFrom(UserSettings data) {
    fingerEnabled = data.fingerEnabled;
    themeColor = data.themeColor;
    version = data.version;
    cachedUserCode = data.cachedUserCode;
    cachedSecretCode = data.cachedSecretCode;
    rememberMe = data.rememberMe;
    fingerUser = data.fingerUser;
    fingerSecretCode = data.fingerSecretCode;
    usingDevelopingUI = data.usingDevelopingUI;
  }
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
