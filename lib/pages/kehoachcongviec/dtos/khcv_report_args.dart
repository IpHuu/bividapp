import 'dart:convert';

import 'package:collection/collection.dart';

class KhcvReportArgs {
  int? tinhTrang;
  int? idKeHoachCongViec;
  String? reportUrl;

  KhcvReportArgs({this.tinhTrang, this.idKeHoachCongViec, this.reportUrl});

  @override
  String toString() {
    return 'KhcvReportArgs(tinhTrang: $tinhTrang, idKeHoachCongViec: $idKeHoachCongViec, reportUrl: $reportUrl)';
  }

  factory KhcvReportArgs.fromMap(Map<String, dynamic> data) {
    return KhcvReportArgs(
      tinhTrang: data['tinhTrang'] as int?,
      idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'idKeHoachCongViec': idKeHoachCongViec,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KhcvReportArgs].
  factory KhcvReportArgs.fromJson(String data) {
    return KhcvReportArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KhcvReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  KhcvReportArgs copyWith({
    int? tinhTrang,
    int? idKeHoachCongViec,
    String? reportUrl,
  }) {
    return KhcvReportArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KhcvReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tinhTrang.hashCode ^ idKeHoachCongViec.hashCode ^ reportUrl.hashCode;
}
