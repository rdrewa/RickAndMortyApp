import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  final int count;

  Info({required this.count});

  factory Info.fromJson(Map<String, dynamic> data) => _$InfoFromJson(data);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
