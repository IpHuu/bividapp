import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class KeHoachCongTacReportArgs
    extends IDocumentReportArgs<KeHoachCongTacReportArgs> {
  int? idGiayXinPhep;
  int? tinhTrang;
  String? reportUrl;

  KeHoachCongTacReportArgs({
    this.idGiayXinPhep,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'KeHoachCongTacReportArgs(idGiayXinPhep: $idGiayXinPhep, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory KeHoachCongTacReportArgs.fromMap(Map<String, dynamic> data) {
    return KeHoachCongTacReportArgs(
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
  /// Parses the string and returns the resulting Json object as [KeHoachCongTacReportArgs].
  factory KeHoachCongTacReportArgs.fromJson(String data) {
    return KeHoachCongTacReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeHoachCongTacReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  KeHoachCongTacReportArgs copyWith({
    int? idGiayXinPhep,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return KeHoachCongTacReportArgs(
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KeHoachCongTacReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idGiayXinPhep.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
