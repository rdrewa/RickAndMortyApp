import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '/core/extension/build_context_theme_extension.dart';
import '/core/util/language_util.dart';

class LanguageSettings extends SettingsTile {
  LanguageSettings({super.key, super.title = const Text('LanguageSetting')});

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          SettingsTile(
            title: Text('settings.language'.tr()),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: ref.watch(languageCodeProvider),
              onChanged: (newValue) {
                if (newValue != null &&
                    context.locale.languageCode != newValue) {
                  context.setLocale(Locale(newValue));
                  ref.read(languageCodeProvider.notifier).state = newValue;
                }
              },
              items: LanguageUtil.supportedLocales
                  .map((locale) => DropdownMenuItem<String>(
                        value: locale.languageCode,
                        child: Text(
                            'settings.langs.${locale.languageCode}'.tr(),
                            style: TextStyle(
                                color: context.colorScheme.onBackground)),
                      ))
                  .toList(),
            ),
          ));
}
