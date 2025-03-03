import 'dart:convert';

import 'package:collection/collection.dart';

class DxmhReportArgs {
  int? tinhTrang;
  int? idKeHoachCongViec;
  int? idDeXuatMh;
  String? reportUrl;

  DxmhReportArgs({
    this.tinhTrang,
    this.idKeHoachCongViec,
    this.idDeXuatMh,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'DxmhReportArgs(tinhTrang: $tinhTrang, idKeHoachCongViec: $idKeHoachCongViec, idDeXuatMh: $idDeXuatMh, reportUrl: $reportUrl)';
  }

  factory DxmhReportArgs.fromMap(Map<String, dynamic> data) {
    return DxmhReportArgs(
      tinhTrang: data['tinhTrang'] as int?,
      idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
      idDeXuatMh: data['idDeXuatMH'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'idKeHoachCongViec': idKeHoachCongViec,
        'idDeXuatMH': idDeXuatMh,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DxmhReportArgs].
  factory DxmhReportArgs.fromJson(String data) {
    return DxmhReportArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DxmhReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DxmhReportArgs copyWith({
    int? tinhTrang,
    int? idKeHoachCongViec,
    int? idDeXuatMh,
    String? reportUrl,
  }) {
    return DxmhReportArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DxmhReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tinhTrang.hashCode ^
      idKeHoachCongViec.hashCode ^
      idDeXuatMh.hashCode ^
      reportUrl.hashCode;
}
