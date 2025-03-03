import 'dart:convert';
import 'package:collection/collection.dart';

class ThanhQuyetToanReportArgs {
  final int? tinhTrang;
  final int? idThanhQuyetToan;
  final String? reportUrl;

  const ThanhQuyetToanReportArgs({
    this.tinhTrang,
    this.idThanhQuyetToan,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'ThanhQuyetToanReportArgs(tinhTrang: $tinhTrang, idThanhQuyetToan: $idThanhQuyetToan, reportUrl: $reportUrl)';
  }

  factory ThanhQuyetToanReportArgs.fromMap(Map<String, dynamic> data) {
    return ThanhQuyetToanReportArgs(
      tinhTrang: data['tinhTrang'] as int?,
      idThanhQuyetToan: data['idThanhQuyetToan'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'idThanhQuyetToan': idThanhQuyetToan,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ThanhQuyetToanReportArgs].
  factory ThanhQuyetToanReportArgs.fromJson(String data) {
    return ThanhQuyetToanReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ThanhQuyetToanReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  ThanhQuyetToanReportArgs copyWith({
    int? tinhTrang,
    int? idThanhQuyetToan,
    String? reportUrl,
  }) {
    return ThanhQuyetToanReportArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      idThanhQuyetToan: idThanhQuyetToan ?? this.idThanhQuyetToan,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ThanhQuyetToanReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tinhTrang.hashCode ^ idThanhQuyetToan.hashCode ^ reportUrl.hashCode;
}
