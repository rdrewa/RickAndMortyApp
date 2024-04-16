import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class ErrorBox extends StatelessWidget {
  final String message;

  const ErrorBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
              color: context.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: context.colorScheme.error, width: 2.0)),
          padding: const EdgeInsets.all(20.0),
          child: Text(
            message,
            style: context.bodyMedium?.copyWith(
                color: context.colorScheme.error, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
