import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_token.freezed.dart';
part 'm_token.g.dart';

@freezed
class MToken with _$MToken {
  factory MToken({
    @Default("") String userid,
    @Default("") String userName,
    @Default("") String userFullName,
    @Default("") String email,
    @Default("") String refreshToken,
    @Default(null) DateTime? validaty,
    @Default(null) DateTime? expireTime,
    @Default("") String tokenId,
  }) = _MToken;

  factory MToken.fromJson(Map<String, dynamic> json) => _$MTokenFromJson(json);
}
