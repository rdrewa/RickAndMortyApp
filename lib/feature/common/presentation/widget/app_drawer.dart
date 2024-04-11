import 'package:flutter/material.dart';

import '/app/app_router.dart';
import 'drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(
        children: const [
          DrawerHeader(child: Text('Rick & Morty Menu')),
          DrawerTile(title: 'Home', icon: Icons.home, route: HomeRoute()),
          DrawerTile(
              title: 'Favorite', icon: Icons.star, route: FavoriteRoute()),
          DrawerTile(
              title: 'Settings', icon: Icons.settings, route: SettingsRoute())
        ],
      ));
}
