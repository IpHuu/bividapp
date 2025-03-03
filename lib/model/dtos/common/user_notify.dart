import 'dart:convert';

import 'package:collection/collection.dart';

class UserNotify {
  int? id;
  String? userCode;
  String? notifyCode;
  String? title;
  String? body;
  bool? lastSeen;
  DateTime? postDate;
  String? imageUrl;

  UserNotify({
    this.id,
    this.userCode,
    this.notifyCode,
    this.title,
    this.body,
    this.lastSeen,
    this.postDate,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'UserNotify(id: $id, userCode: $userCode, notifyCode: $notifyCode, title: $title, body: $body, lastSeen: $lastSeen, postDate: $postDate, imageUrl: $imageUrl)';
  }

  factory UserNotify.fromMap(Map<String, dynamic> data) => UserNotify(
        id: data['id'] as int?,
        userCode: data['userCode'] as String?,
        notifyCode: data['notifyCode'] as String?,
        title: data['title'] as String?,
        body: data['body'] as String?,
        lastSeen: data['lastSeen'] as bool?,
        postDate: data['postDate'] == null
            ? null
            : DateTime.parse(data['postDate'] as String),
        imageUrl: data['imageUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userCode': userCode,
        'notifyCode': notifyCode,
        'title': title,
        'body': body,
        'lastSeen': lastSeen,
        'postDate': postDate?.toIso8601String(),
        'imageUrl': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserNotify].
  factory UserNotify.fromJson(String data) {
    return UserNotify.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserNotify] to a JSON string.
  String toJson() => json.encode(toMap());

  UserNotify copyWith({
    int? id,
    String? userCode,
    String? notifyCode,
    String? title,
    String? body,
    bool? lastSeen,
    DateTime? postDate,
    String? imageUrl,
  }) {
    return UserNotify(
      id: id ?? this.id,
      userCode: userCode ?? this.userCode,
      notifyCode: notifyCode ?? this.notifyCode,
      title: title ?? this.title,
      body: body ?? this.body,
      lastSeen: lastSeen ?? this.lastSeen,
      postDate: postDate ?? this.postDate,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserNotify) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userCode.hashCode ^
      notifyCode.hashCode ^
      title.hashCode ^
      body.hashCode ^
      lastSeen.hashCode ^
      postDate.hashCode ^
      imageUrl.hashCode;
}
