import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final int id;

  const FavoriteScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(), body: const Center(child: Text('Favorite')));
}
