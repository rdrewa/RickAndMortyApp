import 'package:freezed_annotation/freezed_annotation.dart';

import 'characters.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final Characters characters;

  Data({required this.characters});

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
