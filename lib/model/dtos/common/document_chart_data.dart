import 'dart:convert';

import 'package:collection/collection.dart';

class DocumentChartData {
  DateTime? approvedDate;
  String personName;
  String titleName;
  bool approved;
  int stateValue;

  DocumentChartData({
    this.approvedDate,
    this.personName = '',
    this.titleName = '',
    this.approved = false,
    this.stateValue = 0,
  });

  @override
  String toString() {
    return 'DocumentChartData(approvedDate: $approvedDate, personName: $personName, titleName: $titleName, approved: $approved)';
  }

  factory DocumentChartData.fromMap(Map<String, dynamic> data) {
    return DocumentChartData(
      approvedDate: data["approvedDate"] != null
          ? DateTime.parse(data["approvedDate"])
          : null,
      personName: data['personName'] ?? '',
      titleName: data['titleName'] ?? '',
      approved: data['approved'] ?? false,
      stateValue: data['stateValue'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        'approvedDate': approvedDate,
        'personName': personName,
        'titleName': titleName,
        'approved': approved,
        'stateValue': stateValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DocumentChartData].
  factory DocumentChartData.fromJson(String data) {
    return DocumentChartData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DocumentChartData] to a JSON string.
  String toJson() => json.encode(toMap());

  DocumentChartData copyWith({
    DateTime? approvedDate,
    String? personName,
    String? titleName,
    bool? approved,
    int? stateValue,
  }) {
    return DocumentChartData(
      approvedDate: approvedDate ?? this.approvedDate,
      personName: personName ?? this.personName,
      titleName: titleName ?? this.titleName,
      approved: approved ?? this.approved,
      stateValue: stateValue ?? this.stateValue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DocumentChartData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      approvedDate.hashCode ^
      personName.hashCode ^
      titleName.hashCode ^
      approved.hashCode;
}
