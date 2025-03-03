import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class LenhCongTacReportArgs extends IDocumentReportArgs<LenhCongTacReportArgs> {
  int? idGiayXinPhep;
  int? tinhTrang;
  String? reportUrl;

  LenhCongTacReportArgs({
    this.idGiayXinPhep,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'LenhCongTacReportArgs(idGiayXinPhep: $idGiayXinPhep, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory LenhCongTacReportArgs.fromMap(Map<String, dynamic> data) {
    return LenhCongTacReportArgs(
      idGiayXinPhep: data['idGiayXinPhep'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'idGiayXinPhep': idGiayXinPhep,
        'tinhTrang': tinhTrang,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LenhCongTacReportArgs].
  factory LenhCongTacReportArgs.fromJson(String data) {
    return LenhCongTacReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LenhCongTacReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  LenhCongTacReportArgs copyWith({
    int? idGiayXinPhep,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return LenhCongTacReportArgs(
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LenhCongTacReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idGiayXinPhep.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
