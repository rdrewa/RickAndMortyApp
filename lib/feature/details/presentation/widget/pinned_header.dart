import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '/core/extension/build_context_theme_extension.dart';

class PinnedHeader extends StatelessWidget {
  final String header;

  const PinnedHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) => SliverPinnedHeader(
          child: ColoredBox(
        color: context.colorScheme.secondary,
        child: ListTile(
          title: Text(
            header,
            style: context.titleLarge?.copyWith(
                color: context.colorScheme.onSecondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ));
}
