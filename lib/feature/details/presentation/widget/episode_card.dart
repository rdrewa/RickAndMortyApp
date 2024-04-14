import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class EpisodeCard extends StatelessWidget {
  final String title;
  final String number;

  const EpisodeCard({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) => Card(
        color: context.colorScheme.tertiary,
        child: ListTile(
          leading: const Icon(Icons.movie),
          title: Text(title),
          trailing: Text(number,
              style: context.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onTertiary)),
        ),
      );
}
