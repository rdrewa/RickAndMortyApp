import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_app/core/extension/build_context_theme_extension.dart';

import '/app/app_router.dart';
import 'drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              child: Center(
            child: Text(
              'app.menu'.tr(),
              style: context.titleLarge
                  ?.copyWith(color: context.colorScheme.tertiary),
            ),
          )),
          DrawerTile(
              title: 'home.title'.tr(),
              icon: Icons.home,
              route: const HomeRoute()),
          DrawerTile(
              title: 'favorite.title'.tr(),
              icon: Icons.star,
              route: const FavoriteRoute()),
          DrawerTile(
              title: 'settings.title'.tr(),
              icon: Icons.settings,
              route: const SettingsRoute())
        ],
      ));
}
