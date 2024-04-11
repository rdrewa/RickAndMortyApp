import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../feature/home/presentation/screen/home_screen.dart';
import '../feature/details/presentation/screen/details_screen.dart';
import '../feature/favorite/presentation/screen/favorite_screen.dart';
import '../feature/settings/presentation/screen/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailsRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: SettingsRoute.page)
      ];
}
