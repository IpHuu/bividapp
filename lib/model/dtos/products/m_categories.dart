import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_categories.freezed.dart';
part 'm_categories.g.dart';

@freezed
class MCategory with _$MCategory {
  const factory MCategory({
    int? id,
    String? prd_group_name,
  }) = _MCategory;

  factory MCategory.fromJson(Map<String, dynamic> json) =>
      _$MCategoryFromJson(json);
}
