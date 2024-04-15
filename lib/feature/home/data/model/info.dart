import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info extends Equatable {
  final int? next;

  const Info({required this.next});

  factory Info.fromJson(Map<String, dynamic> data) => _$InfoFromJson(data);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  List<Object?> get props => [next];
}
