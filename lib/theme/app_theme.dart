import 'package:flutter/material.dart';
import 'package:rick_morty_app/theme/app_card_theme.dart';
import 'package:rick_morty_app/theme/app_custom_colors.dart';

import 'app_app_bar_theme.dart';
import 'app_text_theme.dart';
import 'app_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightMode = ThemeData.light(useMaterial3: true).copyWith(
      brightness: Brightness.light,
      colorScheme: AppColorScheme.lightScheme,
      scaffoldBackgroundColor: AppColorScheme.lightScheme.background,
      textTheme: AppTextTheme.lightTheme,
      appBarTheme: AppAppBarTheme.lightTheme,
      extensions: [
        AppCustomColors.lightCustomColors.harmonized(AppColorScheme.lightScheme)
      ],
      cardTheme: AppCardTheme.lightTheme);

  static ThemeData darkMode = ThemeData.dark(useMaterial3: true).copyWith(
      brightness: Brightness.dark,
      colorScheme: AppColorScheme.darkScheme,
      scaffoldBackgroundColor: AppColorScheme.darkScheme.background,
      textTheme: AppTextTheme.darkTheme,
      appBarTheme: AppAppBarTheme.darkTheme,
      extensions: [
        AppCustomColors.darkCustomColors.harmonized(AppColorScheme.darkScheme)
      ],
      cardTheme: AppCardTheme.darkTheme);
}
