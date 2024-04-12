import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/character_info.dart';

part 'characters.g.dart';

@JsonSerializable()
class Characters {
  final List<CharacterInfo> results;

  Characters({required this.results});

  factory Characters.fromJson(Map<String, dynamic> data) =>
      _$CharactersFromJson(data);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
