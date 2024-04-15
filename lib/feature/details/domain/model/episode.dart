import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode extends Equatable {
  final String id;
  @JsonKey(name: 'name')
  final String title;
  @JsonKey(name: 'episode')
  final String number;

  const Episode({
    required this.id,
    required this.title,
    required this.number,
  });

  factory Episode.fromJson(Map<String, dynamic> data) =>
      _$EpisodeFromJson(data);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  List<Object?> get props => [id, title, number];
}
