import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_scheme.dart';

class AppTextTheme {
  static final TextTheme _fontTextTheme = GoogleFonts.montserratTextTheme();

  static TextTheme _prepareTheme(ColorScheme colorScheme) => _fontTextTheme
      .apply(
          bodyColor: colorScheme.onBackground,
          displayColor: colorScheme.primary)
      .copyWith(
          labelMedium: _fontTextTheme.labelMedium
              ?.copyWith(color: colorScheme.tertiary));

  AppTextTheme._();

  static TextTheme lightTheme = _prepareTheme(AppColorScheme.lightScheme);

  static TextTheme darkTheme = _prepareTheme(AppColorScheme.darkScheme);
}
