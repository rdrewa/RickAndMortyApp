import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'characters.dart';

part 'character_info_data.g.dart';

@JsonSerializable()
class CharacterInfoData extends Equatable {
  final Characters characters;

  const CharacterInfoData({required this.characters});

  factory CharacterInfoData.fromJson(Map<String, dynamic> data) =>
      _$CharacterInfoDataFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterInfoDataToJson(this);

  @override
  List<Object?> get props => [characters];
}
