import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class ChiPhiCongTacReportArgs
    extends IDocumentReportArgs<ChiPhiCongTacReportArgs> {
  int? idGiayXinPhep;
  int? tinhTrang;
  String? reportUrl;

  ChiPhiCongTacReportArgs({
    this.idGiayXinPhep,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'ChiPhiCongTacReportArgs(idGiayXinPhep: $idGiayXinPhep, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory ChiPhiCongTacReportArgs.fromMap(Map<String, dynamic> data) {
    return ChiPhiCongTacReportArgs(
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
  /// Parses the string and returns the resulting Json object as [ChiPhiCongTacReportArgs].
  factory ChiPhiCongTacReportArgs.fromJson(String data) {
    return ChiPhiCongTacReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChiPhiCongTacReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  ChiPhiCongTacReportArgs copyWith({
    int? idGiayXinPhep,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return ChiPhiCongTacReportArgs(
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChiPhiCongTacReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idGiayXinPhep.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
