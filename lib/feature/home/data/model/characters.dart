import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/character_info.dart';
import 'info.dart';

part 'characters.g.dart';

@JsonSerializable()
class Characters extends Equatable {
  final Info info;
  final List<CharacterInfo> results;

  const Characters({required this.info, required this.results});

  factory Characters.fromJson(Map<String, dynamic> data) =>
      _$CharactersFromJson(data);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);

  @override
  List<Object?> get props => [info, results];
}
