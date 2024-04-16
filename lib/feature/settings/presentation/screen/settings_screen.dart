import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '/core/extension/build_context_theme_extension.dart';
import '../../../common/presentation/widget/app_drawer.dart';
import '../widget/language_settings.dart';
import '../widget/theme_settings.dart';

@RoutePage()
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            tiles: <SettingsTile>[LanguageSettings(), ThemeSettings()],
          ),
        ],
      ),
    );
  }
}
