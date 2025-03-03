import 'dart:convert';

import 'package:bividpharma/model/dtos/user_settings.dart';
import 'package:bividpharma/model/dtos/usertoken.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePreferenceKeys { firstApp, isLogin, authToken, profile }

class BividSettings {
  static const String bividUserKey = 'bivid_user';
  static const String bividUserSetttingKey = 'bivid_user_settings';

  SharedPreferences? _preferences;
  Future<SharedPreferences> get sharedPref async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  UserSettings? _userSettings;
  UserSettings get userSettings => _userSettings!;

  BividSettings() {
    _userSettings = UserSettings.empty();
  }

  Future<void> saveUser(UserToken user) async {
    final func = await sharedPref;

    Map userMap = user.toMap();
    String userJson = jsonEncode(userMap);
    func.setString(bividUserKey, userJson);
  }

  Future<UserToken?> readUser() async {
    final func = await sharedPref;
    String? userJson = func.getString(bividUserKey);

    if (userJson == null) return null;

    Map<String, dynamic> userMap = jsonDecode(userJson);
    var user = UserToken.fromMap(userMap);

    return user;
  }

  Future<void> saveSettings() async {
    final func = await sharedPref;
    final UserSettings data = userSettings;
    Map dataMap = data.toMap();
    String dataJson = jsonEncode(dataMap);
    func.setString(bividUserSetttingKey, dataJson);
  }

  Future<UserSettings> readSettings() async {
    final func = await sharedPref;
    String? dataJson = func.getString(bividUserSetttingKey);
    if (dataJson == null) {
      return userSettings;
    }
    Map<String, dynamic> dataMap = jsonDecode(dataJson);
    var data = UserSettings.fromMap(dataMap);
    userSettings.copyFrom(data);
    return userSettings;
  }
}
