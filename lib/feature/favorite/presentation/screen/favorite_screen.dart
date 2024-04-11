import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/app/app_router.dart';
import '../../../common/presentation/widget/app_drawer.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Center(
          child: Column(
        children: [
          const Text('Favorite'),
          TextButton(
              onPressed: () => context.pushRoute(DetailsRoute(id: 7)),
              child: const Text('Details #7'))
        ],
      )));
}
