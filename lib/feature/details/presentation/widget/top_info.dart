import 'package:flutter/material.dart';

class TopInfo extends StatelessWidget {
  final String name;
  final String image;

  const TopInfo({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 240,
        floating: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(name),
          collapseMode: CollapseMode.pin,
          background: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      );
}
