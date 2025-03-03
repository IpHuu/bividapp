import 'dart:convert';

import 'package:bividpharma/services/core_api_service.dart';
import 'package:collection/collection.dart';

class Company {
  String? companyCode;
  String? shortName;
  String? companyName;
  String? logo;
  String? logoUrl;

  Company(
      {this.companyCode,
      this.shortName,
      this.companyName,
      this.logo,
      this.logoUrl});

  @override
  String toString() {
    return 'Company(companyCode: $companyCode, shortName: $shortName, companyName: $companyName, logo: $logo)';
  }

  factory Company.fromMap(Map<String, dynamic> data) => Company(
        companyCode: data['companyCode'] as String?,
        shortName: data['shortName'] as String?,
        companyName: data['companyName'] as String?,
        logo: data['logo'] as String?,
        logoUrl: "${ApiCoreService.M_HOST_URL}/images/${data['logo'] ?? ''}",
      );

  Map<String, dynamic> toMap() => {
        'companyCode': companyCode,
        'shortName': shortName,
        'companyName': companyName,
        'logo': logo,
        'logoUrl': logoUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Company].
  factory Company.fromJson(String data) {
    return Company.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Company] to a JSON string.
  String toJson() => json.encode(toMap());

  Company copyWith({
    String? companyCode,
    String? shortName,
    String? companyName,
    String? logo,
  }) {
    return Company(
      companyCode: companyCode ?? this.companyCode,
      shortName: shortName ?? this.shortName,
      companyName: companyName ?? this.companyName,
      logo: logo ?? this.logo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Company) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      companyCode.hashCode ^
      shortName.hashCode ^
      companyName.hashCode ^
      logo.hashCode;
}
