import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../details/domain/model/character_details.dart';
import '../../../common/data/source/local/rick_database.dart';

part 'character_info.g.dart';

@JsonSerializable()
class CharacterInfo extends Equatable {
  final String name;
  final String id;
  final String status;
  final String image;
  final String species;

  const CharacterInfo(
      {required this.name,
      required this.id,
      required this.status,
      required this.image,
      required this.species});

  factory CharacterInfo.fromJson(Map<String, dynamic> data) =>
      _$CharacterInfoFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterInfoToJson(this);

  @override
  List<Object?> get props => [name, id, status, image, species];

  factory CharacterInfo.fromFavorite(FavoriteData data) => CharacterInfo(
      name: data.name,
      id: data.id.toString(),
      status: data.status,
      image: data.image,
      species: data.species);

  FavoriteCompanion toFavoriteCompanion() => FavoriteCompanion(
      id: Value(int.parse(id)),
      name: Value(name),
      status: Value(status),
      image: Value(image),
      species: Value(species));

  FavoriteData toFavoriteData() => FavoriteData(
      id: int.parse(id),
      name: name,
      status: status,
      image: image,
      species: species);

  factory CharacterInfo.fromDetails(CharacterDetails details) => CharacterInfo(
      name: details.name,
      id: details.id,
      status: details.status,
      image: details.image,
      species: details.species);
}
