import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_info.g.dart';

@JsonSerializable()
class CharacterInfo extends Equatable {
  final String name;
  final String id;
  final String status;
  final String image;

  const CharacterInfo(
      {required this.name,
      required this.id,
      required this.status,
      required this.image});

  factory CharacterInfo.fromJson(Map<String, dynamic> data) =>
      _$CharacterInfoFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterInfoToJson(this);

  @override
  List<Object?> get props => [name, id, status, image];
}
