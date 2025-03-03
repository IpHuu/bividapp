import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class AttachDocument {
  final int? id;
  final String? code;
  final String? department;
  final String? date;
  final String? fileName;
  final String? extension;
  final String? path;
  final bool? locked;
  final dynamic note;
  final String? createdBy;
  final String? createdDate;
  final dynamic modifiedBy;
  final dynamic modifiedDate;

  const AttachDocument({
    this.id,
    this.code,
    this.department,
    this.date,
    this.fileName,
    this.extension,
    this.path,
    this.locked,
    this.note,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
  });

  @override
  String toString() {
    return 'AttachDocument(id: $id, code: $code, department: $department, date: $date, fileName: $fileName, extension: $extension, path: $path, locked: $locked, note: $note, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate)';
  }

  factory AttachDocument.fromMap(Map<String, dynamic> data) {
    return AttachDocument(
      id: data['id'] as int?,
      code: data['code'] as String?,
      department: data['department'] as String?,
      date: data['date'] as String?,
      fileName: data['fileName'] as String?,
      extension: data['extension'] as String?,
      path: data['path'] as String?,
      locked: data['locked'] as bool?,
      note: data['note'] as dynamic,
      createdBy: data['createdBy'] as String?,
      createdDate: data['createdDate'] as String?,
      modifiedBy: data['modifiedBy'] as dynamic,
      modifiedDate: data['modifiedDate'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'code': code,
        'department': department,
        'date': date,
        'fileName': fileName,
        'extension': extension,
        'path': path,
        'locked': locked,
        'note': note,
        'createdBy': createdBy,
        'createdDate': createdDate,
        'modifiedBy': modifiedBy,
        'modifiedDate': modifiedDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AttachDocument].
  factory AttachDocument.fromJson(String data) {
    return AttachDocument.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AttachDocument] to a JSON string.
  String toJson() => json.encode(toMap());

  AttachDocument copyWith({
    int? id,
    String? code,
    String? department,
    String? date,
    String? fileName,
    String? extension,
    String? path,
    bool? locked,
    dynamic note,
    String? createdBy,
    String? createdDate,
    dynamic modifiedBy,
    dynamic modifiedDate,
  }) {
    return AttachDocument(
      id: id ?? this.id,
      code: code ?? this.code,
      department: department ?? this.department,
      date: date ?? this.date,
      fileName: fileName ?? this.fileName,
      extension: extension ?? this.extension,
      path: path ?? this.path,
      locked: locked ?? this.locked,
      note: note ?? this.note,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AttachDocument) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      code.hashCode ^
      department.hashCode ^
      date.hashCode ^
      fileName.hashCode ^
      extension.hashCode ^
      path.hashCode ^
      locked.hashCode ^
      note.hashCode ^
      createdBy.hashCode ^
      createdDate.hashCode ^
      modifiedBy.hashCode ^
      modifiedDate.hashCode;
}
