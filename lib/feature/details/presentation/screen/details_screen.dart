import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(), body: Center(child: Text('Details $id')));
}
