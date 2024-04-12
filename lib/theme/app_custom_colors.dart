import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppCustomColors {
  AppCustomColors._();

  static const dead = Color(0xFFFF0007);
  static const alive = Color(0xFF00FF0A);
  static const unknown = Color(0xFFD0D3D4);

  static CustomColors lightCustomColors = const CustomColors(
    sourceDead: Color(0xFFFF0007),
    dead: Color(0xFFC00003),
    onDead: Color(0xFFFFFFFF),
    deadContainer: Color(0xFFFFDAD5),
    onDeadContainer: Color(0xFF410000),
    sourceAlive: Color(0xFF00FF0A),
    alive: Color(0xFF006E00),
    onAlive: Color(0xFFFFFFFF),
    aliveContainer: Color(0xFF77FF62),
    onAliveContainer: Color(0xFF002200),
    sourceUnknown: Color(0xFFD0D3D4),
    unknown: Color(0xFF006877),
    onUnknown: Color(0xFFFFFFFF),
    unknownContainer: Color(0xFFA4EEFF),
    onUnknownContainer: Color(0xFF001F25),
  );

  static CustomColors darkCustomColors = const CustomColors(
    sourceDead: Color(0xFFFF0007),
    dead: Color(0xFFFFB4A9),
    onDead: Color(0xFF690001),
    deadContainer: Color(0xFF930002),
    onDeadContainer: Color(0xFFFFDAD5),
    sourceAlive: Color(0xFF00FF0A),
    alive: Color(0xFF00E607),
    onAlive: Color(0xFF003A00),
    aliveContainer: Color(0xFF005300),
    onAliveContainer: Color(0xFF77FF62),
    sourceUnknown: Color(0xFFD0D3D4),
    unknown: Color(0xFF52D7F0),
    onUnknown: Color(0xFF00363F),
    unknownContainer: Color(0xFF004E5A),
    onUnknownContainer: Color(0xFFA4EEFF),
  );
}
