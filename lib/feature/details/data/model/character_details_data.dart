import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/character_details.dart';

part 'character_details_data.g.dart';

@JsonSerializable()
class CharacterDetailsData extends Equatable {
  @JsonKey(name: 'character')
  final CharacterDetails characterDetails;

  const CharacterDetailsData({
    required this.characterDetails,
  });

  factory CharacterDetailsData.fromJson(Map<String, dynamic> data) =>
      _$CharacterDetailsDataFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterDetailsDataToJson(this);

  @override
  List<Object?> get props => [characterDetails];
}
