import 'dart:convert';

import 'package:collection/collection.dart';

class GiayXinPhepReportArgs {
  int? idGiayXinPhep;
  int? tinhTrang;
  String? reportUrl;

  GiayXinPhepReportArgs({
    this.idGiayXinPhep,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'GiayXinPhepReportArgs(idGiayXinPhep: $idGiayXinPhep, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory GiayXinPhepReportArgs.fromMap(Map<String, dynamic> data) {
    return GiayXinPhepReportArgs(
      idGiayXinPhep: data['idGiayXinPhep'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'idGiayXinPhep': idGiayXinPhep,
        'tinhTrang': tinhTrang,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GiayXinPhepReportArgs].
  factory GiayXinPhepReportArgs.fromJson(String data) {
    return GiayXinPhepReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayXinPhepReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  GiayXinPhepReportArgs copyWith({
    int? idGiayXinPhep,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return GiayXinPhepReportArgs(
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayXinPhepReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idGiayXinPhep.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
