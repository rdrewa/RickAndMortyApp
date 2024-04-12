import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/app/app_router.dart';
import 'drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(
        children: [
          DrawerHeader(child: Text('app.menu'.tr())),
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
