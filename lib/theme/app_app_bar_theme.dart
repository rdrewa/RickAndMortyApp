import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme _prepareTheme(ColorScheme colorScheme) => AppBarTheme(
      centerTitle: true,
      elevation: 1.2,
      backgroundColor: colorScheme.background);

  static final AppBarTheme lightTheme =
      _prepareTheme(AppColorScheme.lightScheme);

  static final AppBarTheme darkTheme = _prepareTheme(AppColorScheme.darkScheme);
}
