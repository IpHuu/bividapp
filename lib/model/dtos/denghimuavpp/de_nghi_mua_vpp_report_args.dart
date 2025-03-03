import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiMuaVppReportArgs
    extends IDocumentReportArgs<DeNghiMuaVppReportArgs> {
  int? idDeNghi;
  int? tinhTrang;
  String? reportUrl;

  DeNghiMuaVppReportArgs({this.idDeNghi, this.tinhTrang, this.reportUrl});

  @override
  String toString() {
    return 'DeNghiMuaVppReportArgs(idDeNghi: $idDeNghi, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory DeNghiMuaVppReportArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiMuaVppReportArgs(
      idDeNghi: data['idDeNghi'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      reportUrl: data['reportURL'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'idDeNghi': idDeNghi,
        'tinhTrang': tinhTrang,
        'reportURL': reportUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeNghiMuaVppReportArgs].
  factory DeNghiMuaVppReportArgs.fromJson(String data) {
    return DeNghiMuaVppReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiMuaVppReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiMuaVppReportArgs copyWith({
    int? idDeNghi,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return DeNghiMuaVppReportArgs(
      idDeNghi: idDeNghi ?? this.idDeNghi,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiMuaVppReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idDeNghi.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
