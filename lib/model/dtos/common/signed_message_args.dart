import 'dart:convert';

import 'package:collection/collection.dart';

class SignedMessageArgs {
  String? userCode;
  String? companyCode;
  String? documentType;
  int? documentId;
  String? stateCode;
  String? itemData;

  SignedMessageArgs({
    this.userCode,
    this.companyCode,
    this.documentType,
    this.documentId,
    this.stateCode,
    this.itemData,
  });

  @override
  String toString() {
    return 'SignedMessageArgs(userCode: $userCode, companyCode: $companyCode, documentType: $documentType, documentId: $documentId, stateCode: $stateCode, itemData: $itemData)';
  }

  factory SignedMessageArgs.fromMap(Map<String, dynamic> data) {
    return SignedMessageArgs(
      userCode: data['userCode'] as String?,
      companyCode: data['companyCode'] as String?,
      documentType: data['documentType'] as String?,
      documentId: data['documentId'] as int?,
      stateCode: data['stateCode'] as String?,
      itemData: data['itemData'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'userCode': userCode,
        'companyCode': companyCode,
        'documentType': documentType,
        'documentId': documentId,
        'stateCode': stateCode,
        'itemData': itemData,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignedMessageArgs].
  factory SignedMessageArgs.fromJson(String data) {
    return SignedMessageArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SignedMessageArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  SignedMessageArgs copyWith({
    String? userCode,
    String? companyCode,
    String? documentType,
    int? documentId,
    String? stateCode,
    String? itemData,
  }) {
    return SignedMessageArgs(
      userCode: userCode ?? this.userCode,
      companyCode: companyCode ?? this.companyCode,
      documentType: documentType ?? this.documentType,
      documentId: documentId ?? this.documentId,
      stateCode: stateCode ?? this.stateCode,
      itemData: itemData ?? this.itemData,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SignedMessageArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      userCode.hashCode ^
      companyCode.hashCode ^
      documentType.hashCode ^
      documentId.hashCode ^
      stateCode.hashCode ^
      itemData.hashCode;
}
