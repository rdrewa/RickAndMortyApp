import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '/core/extension/build_context_theme_extension.dart';
import '/core/util/language_util.dart';
import '../../../common/presentation/widget/app_drawer.dart';

@RoutePage()
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = useState<bool>(false);
    final selectedLanguage = useState<String>('en');

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      drawer: const AppDrawer(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('settings.header'.tr(),
                style: context.titleMedium
                    ?.copyWith(color: context.colorScheme.secondary)),
            tiles: <SettingsTile>[
              SettingsTile(
                title: Text('settings.language'.tr()),
                leading: const Icon(Icons.language),
                trailing: DropdownButton<String>(
                  value: selectedLanguage.value,
                  onChanged: (newValue) {
                    selectedLanguage.value = newValue!;
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
              ),
              SettingsTile.switchTile(
                onToggle: (value) => isDarkTheme.value = value,
                initialValue: isDarkTheme.value,
                leading: const Icon(Icons.dark_mode),
                title: Text('settings.dark_theme'.tr()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
