import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final String name;
  final String dimension;

  const Location({
    required this.name,
    required this.dimension,
  });

  factory Location.fromJson(Map<String, dynamic> data) =>
      _$LocationFromJson(data);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [name, dimension];
}
