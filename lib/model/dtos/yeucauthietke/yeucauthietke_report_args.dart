import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class YeuCauThietKeReportArgs
    extends IDocumentReportArgs<YeuCauThietKeReportArgs> {
  int? idAutoQC;
  int? tinhTrang;
  String? reportUrl;

  YeuCauThietKeReportArgs({
    this.idAutoQC,
    this.tinhTrang,
    this.reportUrl,
  });

  @override
  String toString() {
    return 'YeuCauThietKeReportArgs(idYeuCauThietKe: $idAutoQC, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory YeuCauThietKeReportArgs.fromMap(Map<String, dynamic> data) {
    return YeuCauThietKeReportArgs(
      idAutoQC: data['idYeuCauThietKe'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'idYeuCauThietKe': idAutoQC,
        'tinhTrang': tinhTrang,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [YeuCauThietKeReportArgs].
  factory YeuCauThietKeReportArgs.fromJson(String data) {
    return YeuCauThietKeReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [YeuCauThietKeReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  YeuCauThietKeReportArgs copyWith({
    int? idAutoQC,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return YeuCauThietKeReportArgs(
      idAutoQC: idAutoQC ?? this.idAutoQC,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! YeuCauThietKeReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idAutoQC.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
