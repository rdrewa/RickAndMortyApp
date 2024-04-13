import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class StatusIcon extends StatelessWidget {
  final String status;
  const StatusIcon({super.key, required this.status});

  @override
  Widget build(BuildContext context) => switch (status) {
        'Alive' => Icon(Icons.thumb_up, color: context.customColors.alive),
        'Dead' => Icon(Icons.thumb_down, color: context.customColors.dead),
        _ => Icon(Icons.question_mark, color: context.customColors.unknown),
      };
}
