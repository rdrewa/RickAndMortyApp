import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app/rick_morty_app.dart';
import 'core/util/language_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: LanguageUtil.supportedLocales,
      path: 'assets/i18n',
      fallbackLocale: LanguageUtil.locale,
      startLocale: LanguageUtil.locale,
      useOnlyLangCode: true,
      child: const RickMortyApp()));
}
