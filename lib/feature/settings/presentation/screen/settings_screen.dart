import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widget/app_drawer.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Settings')));
}
