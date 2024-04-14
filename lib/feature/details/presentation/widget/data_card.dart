import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class DataCard extends StatelessWidget {
  final String label;
  final String text;
  final Widget? icon;

  const DataCard(
      {super.key, required this.label, required this.text, this.icon});

  @override
  Widget build(BuildContext context) => Card(
      color: context.colorScheme.tertiary,
      child: text.isNotEmpty
          ? ListTile(
              title: Text(label),
              subtitle: Text(
                text,
                style: context.bodySmall
                    ?.copyWith(color: context.colorScheme.onTertiary),
              ),
              trailing: icon)
          : const SizedBox.shrink());
}
