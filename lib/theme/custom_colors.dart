import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceDead,
    required this.dead,
    required this.onDead,
    required this.deadContainer,
    required this.onDeadContainer,
    required this.sourceAlive,
    required this.alive,
    required this.onAlive,
    required this.aliveContainer,
    required this.onAliveContainer,
    required this.sourceUnknown,
    required this.unknown,
    required this.onUnknown,
    required this.unknownContainer,
    required this.onUnknownContainer,
  });

  final Color? sourceDead;
  final Color? dead;
  final Color? onDead;
  final Color? deadContainer;
  final Color? onDeadContainer;
  final Color? sourceAlive;
  final Color? alive;
  final Color? onAlive;
  final Color? aliveContainer;
  final Color? onAliveContainer;
  final Color? sourceUnknown;
  final Color? unknown;
  final Color? onUnknown;
  final Color? unknownContainer;
  final Color? onUnknownContainer;

  @override
  CustomColors copyWith({
    Color? sourceDead,
    Color? dead,
    Color? onDead,
    Color? deadContainer,
    Color? onDeadContainer,
    Color? sourceAlive,
    Color? alive,
    Color? onAlive,
    Color? aliveContainer,
    Color? onAliveContainer,
    Color? sourceUnknown,
    Color? unknown,
    Color? onUnknown,
    Color? unknownContainer,
    Color? onUnknownContainer,
  }) {
    return CustomColors(
      sourceDead: sourceDead ?? this.sourceDead,
      dead: dead ?? this.dead,
      onDead: onDead ?? this.onDead,
      deadContainer: deadContainer ?? this.deadContainer,
      onDeadContainer: onDeadContainer ?? this.onDeadContainer,
      sourceAlive: sourceAlive ?? this.sourceAlive,
      alive: alive ?? this.alive,
      onAlive: onAlive ?? this.onAlive,
      aliveContainer: aliveContainer ?? this.aliveContainer,
      onAliveContainer: onAliveContainer ?? this.onAliveContainer,
      sourceUnknown: sourceUnknown ?? this.sourceUnknown,
      unknown: unknown ?? this.unknown,
      onUnknown: onUnknown ?? this.onUnknown,
      unknownContainer: unknownContainer ?? this.unknownContainer,
      onUnknownContainer: onUnknownContainer ?? this.onUnknownContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceDead: Color.lerp(sourceDead, other.sourceDead, t),
      dead: Color.lerp(dead, other.dead, t),
      onDead: Color.lerp(onDead, other.onDead, t),
      deadContainer: Color.lerp(deadContainer, other.deadContainer, t),
      onDeadContainer: Color.lerp(onDeadContainer, other.onDeadContainer, t),
      sourceAlive: Color.lerp(sourceAlive, other.sourceAlive, t),
      alive: Color.lerp(alive, other.alive, t),
      onAlive: Color.lerp(onAlive, other.onAlive, t),
      aliveContainer: Color.lerp(aliveContainer, other.aliveContainer, t),
      onAliveContainer: Color.lerp(onAliveContainer, other.onAliveContainer, t),
      sourceUnknown: Color.lerp(sourceUnknown, other.sourceUnknown, t),
      unknown: Color.lerp(unknown, other.unknown, t),
      onUnknown: Color.lerp(onUnknown, other.onUnknown, t),
      unknownContainer: Color.lerp(unknownContainer, other.unknownContainer, t),
      onUnknownContainer:
          Color.lerp(onUnknownContainer, other.onUnknownContainer, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
