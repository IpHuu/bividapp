import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_app.freezed.dart';
part 'setting_app.g.dart';

@freezed
class SettingApp with _$SettingApp {
  factory SettingApp({
    @Default(false) bool fingerEnabled,
    @Default(1) int themeColor,
    String? cachedUserCode,
    String? cachedSecretCode,
    @Default(false) bool rememberMe,
    String? fingerUser,
    String? fingerSecretCode,
  }) = $SettingApp;

  factory SettingApp.fromJson(Map<String, dynamic> json) =>
      _$SettingAppFromJson(json);
}
