import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_pagination.freezed.dart';
part 'm_pagination.g.dart';

@freezed
class MPagination with _$MPagination {
  factory MPagination({
    @Default(0) int current_page,
    @Default(0) int total,
    @Default(0) int last_page,
    @Default(0) int per_page,
  }) = _MPagination;

  factory MPagination.fromJson(Map<String, dynamic> json) =>
      _$MPaginationFromJson(json);
}
