import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PinnedHeader extends StatelessWidget {
  final String header;

  const PinnedHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) => SliverPinnedHeader(
          child: ListTile(
        title: Text(header),
      ));
}
