import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiCapVppReportArgs
    extends IDocumentReportArgs<DeNghiCapVppReportArgs> {
  int? idDeNghi;
  int? tinhTrang;
  String? reportUrl;

  DeNghiCapVppReportArgs({this.idDeNghi, this.tinhTrang, this.reportUrl});

  @override
  String toString() {
    return 'DeNghiCapVppReportArgs(idDeNghi: $idDeNghi, tinhTrang: $tinhTrang, reportUrl: $reportUrl)';
  }

  factory DeNghiCapVppReportArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiCapVppReportArgs(
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
  /// Parses the string and returns the resulting Json object as [DeNghiCapVppReportArgs].
  factory DeNghiCapVppReportArgs.fromJson(String data) {
    return DeNghiCapVppReportArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiCapVppReportArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiCapVppReportArgs copyWith({
    int? idDeNghi,
    int? tinhTrang,
    String? reportUrl,
  }) {
    return DeNghiCapVppReportArgs(
      idDeNghi: idDeNghi ?? this.idDeNghi,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      reportUrl: reportUrl ?? this.reportUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiCapVppReportArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idDeNghi.hashCode ^ tinhTrang.hashCode ^ reportUrl.hashCode;
}
