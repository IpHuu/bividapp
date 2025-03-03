import 'dart:convert';

import 'package:collection/collection.dart';

class DeNghiCapSimReportArgs {
  int? idDeNghi;
  int? tinhTrang;
  String? reportUrl;

  DeNghiCapSimReportArgs({this.idDeNghi, this.tinhTrang, this.reportUrl});

  @override
  String toString() {
    return 'DeNghiCapSimReportArgs(idDeNghi: $idDeNghi, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory DeNghiCapSimReportArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiCapSimReportArgs(
      idDeNghi: data['idDeNghi'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'idDeNghi': idDeNghi,
        'tinhTrang': tinhTrang,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeNghiCapSimReportArgs].
  factory DeNghiCapSimReportArgs.fromJson(String data) {
    return DeNghiCapSimReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiCapSimArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiCapSimReportArgs copyWith({
    int? idDeNghi,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return DeNghiCapSimReportArgs(
      idDeNghi: idDeNghi ?? this.idDeNghi,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiCapSimReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idDeNghi.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
