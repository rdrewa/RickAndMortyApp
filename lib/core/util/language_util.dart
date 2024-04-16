import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageCodeProvider =
    StateProvider<String>((ref) => LanguageUtil.locale.languageCode);

class LanguageUtil {
  static const Locale locale = Locale('en');

  static List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('pl'),
  ];
}
