import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/util/language_util.dart';
import '/theme/app_theme.dart';

import 'app_router.dart';

class RickMortyApp extends ConsumerWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(ref.watch(languageCodeProvider)),
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: ref.watch(themeModeProvider));
}
