import 'dart:convert';

import 'package:collection/collection.dart';

///
/// Ref: SignStepParameter
///
class SignStepParameterArgs {
  int? reportId;
  bool? isApprove;
  String? mainId;
  String? loaiTrinhKy;
  String? userCode;
  int? stepId;
  String? noiDung01;
  String? noiDung02;
  String? noiDung03;
  String? noiDung04;
  String? noiDung05;
  String? noiDung06;
  String? noiDung07;

  SignStepParameterArgs({
    this.reportId,
    this.isApprove,
    this.mainId,
    this.loaiTrinhKy,
    this.userCode,
    this.stepId,
    this.noiDung01,
    this.noiDung02,
    this.noiDung03,
    this.noiDung04,
    this.noiDung05,
    this.noiDung06,
    this.noiDung07,
  });

  @override
  String toString() {
    return 'SignStepParameter(reportId: $reportId, isApprove: $isApprove, mainId: $mainId, loaiTrinhKy: $loaiTrinhKy, userCode: $userCode, stepId: $stepId, noiDung01: $noiDung01, noiDung02: $noiDung02, noiDung03: $noiDung03, noiDung04: $noiDung04, noiDung05: $noiDung05, noiDung06: $noiDung06, noiDung07: $noiDung07)';
  }

  factory SignStepParameterArgs.fromMap(Map<String, dynamic> data) {
    return SignStepParameterArgs(
      reportId: data['reportId'] as int?,
      isApprove: data['isApprove'] as bool?,
      mainId: data['mainId'] as String?,
      loaiTrinhKy: data['loaiTrinhKy'] as String?,
      userCode: data['userCode'] as String?,
      stepId: data['stepId'] as int?,
      noiDung01: data['noiDung_01'] as String?,
      noiDung02: data['noiDung_02'] as String?,
      noiDung03: data['noiDung_03'] as String?,
      noiDung04: data['noiDung_04'] as String?,
      noiDung05: data['noiDung_05'] as String?,
      noiDung06: data['noiDung_06'] as String?,
      noiDung07: data['noiDung_07'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'reportId': reportId,
        'isApprove': isApprove,
        'mainId': mainId,
        'loaiTrinhKy': loaiTrinhKy,
        'userCode': userCode,
        'stepId': stepId,
        'noiDung_01': noiDung01,
        'noiDung_02': noiDung02,
        'noiDung_03': noiDung03,
        'noiDung_04': noiDung04,
        'noiDung_05': noiDung05,
        'noiDung_06': noiDung06,
        'noiDung_07': noiDung07,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignStepParameter].
  factory SignStepParameterArgs.fromJson(String data) {
    return SignStepParameterArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SignStepParameter] to a JSON string.
  String toJson() => json.encode(toMap());

  SignStepParameterArgs copyWith({
    int? reportId,
    bool? isApprove,
    String? mainId,
    String? loaiTrinhKy,
    String? userCode,
    int? stepId,
    String? noiDung01,
    String? noiDung02,
    String? noiDung03,
    String? noiDung04,
    String? noiDung05,
    String? noiDung06,
    String? noiDung07,
  }) {
    return SignStepParameterArgs(
      reportId: reportId ?? this.reportId,
      isApprove: isApprove ?? this.isApprove,
      mainId: mainId ?? this.mainId,
      loaiTrinhKy: loaiTrinhKy ?? this.loaiTrinhKy,
      userCode: userCode ?? this.userCode,
      stepId: stepId ?? this.stepId,
      noiDung01: noiDung01 ?? this.noiDung01,
      noiDung02: noiDung02 ?? this.noiDung02,
      noiDung03: noiDung03 ?? this.noiDung03,
      noiDung04: noiDung04 ?? this.noiDung04,
      noiDung05: noiDung05 ?? this.noiDung05,
      noiDung06: noiDung06 ?? this.noiDung06,
      noiDung07: noiDung07 ?? this.noiDung07,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SignStepParameterArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      reportId.hashCode ^
      isApprove.hashCode ^
      mainId.hashCode ^
      loaiTrinhKy.hashCode ^
      userCode.hashCode ^
      stepId.hashCode ^
      noiDung01.hashCode ^
      noiDung02.hashCode ^
      noiDung03.hashCode ^
      noiDung04.hashCode ^
      noiDung05.hashCode ^
      noiDung06.hashCode ^
      noiDung07.hashCode;
}
