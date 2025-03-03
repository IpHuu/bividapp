import 'dart:convert';
import 'package:bividpharma/pages/kehoachcongviec/dtos/online_duyet_step.dart';
import 'package:collection/collection.dart';

class SignParameterItem {
  int? reportId;
  String? mainId;
  String? loaiTrinhKy;
  List<OnlineDuyetStep>? lines;

  SignParameterItem({
    this.reportId,
    this.mainId,
    this.loaiTrinhKy,
    this.lines,
  });

  @override
  String toString() {
    return 'SignParameterItem(reportId: $reportId, mainId: $mainId, loaiTrinhKy: $loaiTrinhKy, lines: $lines)';
  }

  factory SignParameterItem.fromMap(Map<String, dynamic> data) {
    return SignParameterItem(
      reportId: data['reportId'] as int?,
      mainId: data['mainId'] as String?,
      loaiTrinhKy: data['loaiTrinhKy'] as String?,
      lines: (data['lines'] as List<dynamic>?)
          ?.map((e) => OnlineDuyetStep.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'reportId': reportId,
        'mainId': mainId,
        'loaiTrinhKy': loaiTrinhKy,
        'lines': lines?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignParameterItem].
  factory SignParameterItem.fromJson(String data) {
    return SignParameterItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SignParameterItem] to a JSON string.
  String toJson() => json.encode(toMap());

  SignParameterItem copyWith({
    int? reportId,
    String? mainId,
    String? loaiTrinhKy,
    List<OnlineDuyetStep>? lines,
  }) {
    return SignParameterItem(
      reportId: reportId ?? this.reportId,
      mainId: mainId ?? this.mainId,
      loaiTrinhKy: loaiTrinhKy ?? this.loaiTrinhKy,
      lines: lines ?? this.lines,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SignParameterItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      reportId.hashCode ^
      mainId.hashCode ^
      loaiTrinhKy.hashCode ^
      lines.hashCode;
}
