import 'dart:convert';

import 'package:collection/collection.dart';

class Currency {
  String? maCty;
  String? maNt;
  String? tenNt;
  bool? isksd;

  Currency({this.maCty, this.maNt, this.tenNt, this.isksd});

  factory Currency.fromMap(Map<String, dynamic> data) => Currency(
        maCty: data['ma_cty'] as String?,
        maNt: data['ma_nt'] as String?,
        tenNt: data['ten_nt'] as String?,
        isksd: data['isksd'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'ma_cty': maCty,
        'ma_nt': maNt,
        'ten_nt': tenNt,
        'isksd': isksd,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Currency].
  factory Currency.fromJson(String data) {
    return Currency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Currency] to a JSON string.
  String toJson() => json.encode(toMap());

  Currency copyWith({
    String? maCty,
    String? maNt,
    String? tenNt,
    bool? isksd,
  }) {
    return Currency(
      maCty: maCty ?? this.maCty,
      maNt: maNt ?? this.maNt,
      tenNt: tenNt ?? this.tenNt,
      isksd: isksd ?? this.isksd,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Currency) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      maCty.hashCode ^ maNt.hashCode ^ tenNt.hashCode ^ isksd.hashCode;
}
