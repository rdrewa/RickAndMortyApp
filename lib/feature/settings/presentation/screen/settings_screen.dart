import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final int id;

  const SettingsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(), body: const Center(child: Text('Settings')));
}
