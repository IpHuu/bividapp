import 'dart:convert';

import 'package:collection/collection.dart';

class DocumentOption {
  int? id;
  String? companyCode;
  String? voucherCode;
  int? state;
  String? defaultPerson;

  DocumentOption({
    this.id,
    this.companyCode,
    this.voucherCode,
    this.state,
    this.defaultPerson,
  });

  @override
  String toString() {
    return 'DocumentOption(id: $id, companyCode: $companyCode, voucherCode: $voucherCode, state: $state, defaultPerson: $defaultPerson)';
  }

  factory DocumentOption.fromMap(Map<String, dynamic> data) {
    return DocumentOption(
      id: data['id'] as int?,
      companyCode: data['companyCode'] as String?,
      voucherCode: data['voucherCode'] as String?,
      state: data['state'] as int?,
      defaultPerson: data['defaultPerson'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'companyCode': companyCode,
        'voucherCode': voucherCode,
        'state': state,
        'defaultPerson': defaultPerson,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DocumentOption].
  factory DocumentOption.fromJson(String data) {
    return DocumentOption.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DocumentOption] to a JSON string.
  String toJson() => json.encode(toMap());

  DocumentOption copyWith({
    int? id,
    String? companyCode,
    String? voucherCode,
    int? state,
    String? defaultPerson,
  }) {
    return DocumentOption(
      id: id ?? this.id,
      companyCode: companyCode ?? this.companyCode,
      voucherCode: voucherCode ?? this.voucherCode,
      state: state ?? this.state,
      defaultPerson: defaultPerson ?? this.defaultPerson,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DocumentOption) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      companyCode.hashCode ^
      voucherCode.hashCode ^
      state.hashCode ^
      defaultPerson.hashCode;
}
