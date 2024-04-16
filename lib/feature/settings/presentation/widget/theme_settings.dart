import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../theme/app_theme.dart';

class ThemeSettings extends SettingsTile {
  ThemeSettings({super.key, super.title = const Text('ThemeSetting')});

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          SettingsTile.switchTile(
            onToggle: (value) => ref.read(themeModeProvider.notifier).state =
                value ? ThemeMode.dark : ThemeMode.light,
            initialValue: ref.watch(themeModeProvider) == ThemeMode.dark,
            leading: const Icon(Icons.dark_mode),
            title: Text('settings.dark_theme'.tr()),
          ));
}
