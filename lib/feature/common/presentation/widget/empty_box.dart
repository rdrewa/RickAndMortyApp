import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class EmptyBox extends StatelessWidget {
  final String message;

  const EmptyBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: context.colorScheme.secondary, width: 2.0)),
          padding: const EdgeInsets.all(20.0),
          child: Text(
            message,
            style: context.bodyMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}
