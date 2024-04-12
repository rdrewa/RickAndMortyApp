import 'package:envied/envied.dart';

part 'config.g.dart';

@envied
abstract class Config {
  @EnviedField(varName: 'LINK')
  static const String link = _Config.link;
}
