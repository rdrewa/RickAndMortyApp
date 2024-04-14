import 'package:freezed_annotation/freezed_annotation.dart';

part 'origin.g.dart';

@JsonSerializable()
class Origin {
  final String name;
  final DateTime? created;

  Origin({
    required this.name,
    required this.created,
  });

  factory Origin.fromJson(Map<String, dynamic> data) => _$OriginFromJson(data);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
