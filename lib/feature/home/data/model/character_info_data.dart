import 'package:freezed_annotation/freezed_annotation.dart';

import 'characters.dart';

part 'character_info_data.g.dart';

@JsonSerializable()
class CharacterInfoData {
  final Characters characters;

  CharacterInfoData({required this.characters});

  factory CharacterInfoData.fromJson(Map<String, dynamic> data) =>
      _$CharacterInfoDataFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterInfoDataToJson(this);
}
