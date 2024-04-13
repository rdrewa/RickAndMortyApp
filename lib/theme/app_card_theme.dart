import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme _prepareTheme(ColorScheme colorScheme) =>
      CardTheme(color: colorScheme.primary);

  static final CardTheme lightTheme = _prepareTheme(AppColorScheme.lightScheme);

  static final CardTheme darkTheme = _prepareTheme(AppColorScheme.darkScheme);
}
