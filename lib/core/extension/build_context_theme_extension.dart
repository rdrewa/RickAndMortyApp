import 'package:flutter/material.dart';

import '../../theme/custom_colors.dart';

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  CustomColors get customColors => theme.extension<CustomColors>()!;

  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get labelMedium => textTheme.labelMedium;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get bodyMedium => textTheme.bodyMedium;

  TextStyle? get titleLarge => textTheme.titleLarge;

  TextStyle? get headlineSmall => textTheme.headlineSmall;
}
