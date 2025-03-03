import 'dart:convert';

import 'package:collection/collection.dart';

class LoginParam {
  String? userName;
  String? fullName;
  String? password;
  String? deviceName;
  String? deviceIpv4;
  String? publicIpv4;
  String? publicIpv6;

  LoginParam({
    this.userName = '',
    this.fullName = '',
    this.password = '',
    this.deviceName = '',
    this.deviceIpv4 = '',
    this.publicIpv4 = '',
    this.publicIpv6 = '',
  });

  @override
  String toString() {
    return 'LoginParam(userName: $userName, fullName: $fullName, password: $password, deviceName: $deviceName, deviceIpv4: $deviceIpv4, publicIpv4: $publicIpv4, publicIpv6: $publicIpv6)';
  }

  factory LoginParam.fromMap(Map<String, dynamic> data) => LoginParam(
        userName: data['userName'] as String?,
        fullName: data['fullName'] as String?,
        password: data['password'] as String?,
        deviceName: data['deviceName'] as String?,
        deviceIpv4: data['deviceIpv4'] as String?,
        publicIpv4: data['publicIpv4'] as String?,
        publicIpv6: data['publicIpv6'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userName': userName,
        'fullName': fullName,
        'password': password,
        'deviceName': deviceName,
        'deviceIpv4': deviceIpv4,
        'publicIpv4': publicIpv4,
        'publicIpv6': publicIpv6,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginParam].
  factory LoginParam.fromJson(String data) {
    return LoginParam.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginParam] to a JSON string.
  String toJson() => json.encode(toMap());

  LoginParam copyWith({
    String? userName,
    String? fullName,
    String? password,
    String? deviceName,
    String? deviceIpv4,
    String? publicIpv4,
    String? publicIpv6,
  }) {
    return LoginParam(
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      deviceName: deviceName ?? this.deviceName,
      deviceIpv4: deviceIpv4 ?? this.deviceIpv4,
      publicIpv4: publicIpv4 ?? this.publicIpv4,
      publicIpv6: publicIpv6 ?? this.publicIpv6,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginParam) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      userName.hashCode ^
      fullName.hashCode ^
      password.hashCode ^
      deviceName.hashCode ^
      deviceIpv4.hashCode ^
      publicIpv4.hashCode ^
      publicIpv6.hashCode;
}
