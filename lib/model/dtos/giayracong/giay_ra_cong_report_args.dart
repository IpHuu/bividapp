import 'dart:convert';

import 'package:collection/collection.dart';

class GiayRaCongReportArgs {
  int? idGiayXinPhep;
  int? tinhTrang;
  String? reportUrl;

  GiayRaCongReportArgs({
    this.idGiayXinPhep,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'GiayRaCongReportArgs(idGiayXinPhep: $idGiayXinPhep, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory GiayRaCongReportArgs.fromMap(Map<String, dynamic> data) {
    return GiayRaCongReportArgs(
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
  /// Parses the string and returns the resulting Json object as [GiayRaCongReportArgs].
  factory GiayRaCongReportArgs.fromJson(String data) {
    return GiayRaCongReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayRaCongReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  GiayRaCongReportArgs copyWith({
    int? idGiayXinPhep,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return GiayRaCongReportArgs(
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayRaCongReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idGiayXinPhep.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
