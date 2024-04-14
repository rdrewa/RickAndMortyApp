import 'package:freezed_annotation/freezed_annotation.dart';

import 'episode.dart';
import 'location.dart';
import 'origin.dart';

part 'character_details.g.dart';

@JsonSerializable()
class CharacterDetails {
  final String name;
  final String id;
  final String status;
  final String type;
  final String image;
  final String species;
  final Origin origin;
  final String gender;
  final List<Episode> episode;
  final Location location;

  CharacterDetails({
    required this.name,
    required this.id,
    required this.status,
    required this.type,
    required this.image,
    required this.species,
    required this.origin,
    required this.gender,
    required this.episode,
    required this.location,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic> data) =>
      _$CharacterDetailsFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterDetailsToJson(this);

  String get speciesGender =>
      'character.species_gender.${species == 'Human' ? 'human' : 'other'}_${gender.toLowerCase()}';
}
