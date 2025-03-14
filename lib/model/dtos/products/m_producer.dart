import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_producer.freezed.dart';
part 'm_producer.g.dart';

@freezed
class Producer with _$Producer {
  const factory Producer({
    int? id,
    String? prd_manuf_name,
  }) = _Producer;

  factory Producer.fromJson(Map<String, dynamic> json) =>
      _$ProducerFromJson(json);
}
