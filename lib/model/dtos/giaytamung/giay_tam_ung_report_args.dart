import 'dart:convert';

import 'package:collection/collection.dart';

class GiayTamUngReportArgs {
  int? idTamUng;
  int? tinhTrang;
  int? idKeHoachCongViec;
  int? idDeXuatMh;
  String? reportUrl;

  GiayTamUngReportArgs({
    this.idTamUng,
    this.tinhTrang,
    this.idKeHoachCongViec,
    this.idDeXuatMh,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'GiayTamUngReportArgs(idTamUng: $idTamUng, tinhTrang: $tinhTrang, idKeHoachCongViec: $idKeHoachCongViec, idDeXuatMh: $idDeXuatMh, reportUrl: $reportUrl)';
  }

  factory GiayTamUngReportArgs.fromMap(Map<String, dynamic> data) {
    return GiayTamUngReportArgs(
      idTamUng: data['idTamUng'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
      idDeXuatMh: data['idDeXuatMH'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'idTamUng': idTamUng,
        'tinhTrang': tinhTrang,
        'idKeHoachCongViec': idKeHoachCongViec,
        'idDeXuatMH': idDeXuatMh,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GiayTamUngReportArgs].
  factory GiayTamUngReportArgs.fromJson(String data) {
    return GiayTamUngReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayTamUngReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  GiayTamUngReportArgs copyWith({
    int? idTamUng,
    int? tinhTrang,
    int? idKeHoachCongViec,
    int? idDeXuatMh,
    String? reportUrl,
  }) {
    return GiayTamUngReportArgs(
      idTamUng: idTamUng ?? this.idTamUng,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayTamUngReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idTamUng.hashCode ^
      tinhTrang.hashCode ^
      idKeHoachCongViec.hashCode ^
      idDeXuatMh.hashCode ^
      reportUrl.hashCode;
}
