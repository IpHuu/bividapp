import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_login.freezed.dart';
part 'm_login.g.dart';

@freezed
class MLogin with _$MLogin {
  factory MLogin({
    @Default("") String email,
    @Default("") String userName,
    @Default("") String fullName,
    @Default("") String password,
    @Default("") String deviceName,
    @Default("") String deviceIpv4,
    @Default("") String publicIpv4,
    @Default("") String publicIpv6,
  }) = $MLogin;

  factory MLogin.fromJson(Map<String, dynamic> json) => _$MLoginFromJson(json);
}
