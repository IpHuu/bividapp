import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/dtos/base/auth_response.dart';
import '../model/dtos/setting_app/setting_app.dart';

enum SharePreferenceKeys { firstApp, isLogin, authToken, userInfo, settingApp }

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._internal();
  late SharedPreferences _prefs;

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal();

  /// Trả về instance duy nhất
  static SharedPreferencesManager get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    return _prefs;
  }

  bool get isFirstApp =>
      _prefs.getBool(SharePreferenceKeys.firstApp.name) ?? true;

  set setFirstApp(bool value) =>
      _prefs.setBool(SharePreferenceKeys.firstApp.name, value);

  //--------State Login----------
  bool get isLogin => _prefs.getBool(SharePreferenceKeys.isLogin.name) ?? false;

  set saveIsLogin(bool value) =>
      _prefs.setBool(SharePreferenceKeys.isLogin.name, value);
  // #SaveUser
  // Lưu thông tin Result vào SharedPreferences
  Future<void> saveUserInfo(Result result) async {
    String jsonString = jsonEncode(result.toJson());
    await _prefs.setString(SharePreferenceKeys.userInfo.name, jsonString);
  }

  // Lấy thông tin Result từ SharedPreferences
  Result? get userInfo {
    String? jsonString = _prefs.getString(SharePreferenceKeys.userInfo.name);
    if (jsonString == null) return null;
    return Result.fromJson(jsonDecode(jsonString));
  }

  // Xóa thông tin user
  Future<void> clearUserInfo() async {
    await _prefs.remove(SharePreferenceKeys.userInfo.name);
  }

  // 🔹 Lưu SettingApp vào SharedPreferences
  Future<void> saveSettingApp(SettingApp setting) async {
    String jsonString = jsonEncode(setting.toJson());
    await _prefs.setString(SharePreferenceKeys.settingApp.name, jsonString);
  }

  // 🔹 Lấy SettingApp từ SharedPreferences
  SettingApp getSettingApp() {
    String? jsonString = _prefs.getString(SharePreferenceKeys.settingApp.name);
    if (jsonString == null) return SettingApp();

    return SettingApp.fromJson(jsonDecode(jsonString));
  }
}
