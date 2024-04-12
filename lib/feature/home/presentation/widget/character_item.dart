import 'package:flutter/material.dart';
import 'package:rick_morty_app/core/extension/build_context_theme_extension.dart';
import 'status_icon.dart';

import '../../domain/model/character_info.dart';

class CharacterItem extends StatelessWidget {
  final CharacterInfo item;

  const CharacterItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: Image(image: NetworkImage(item.image)),
          title: Text('[${item.id}] ${item.name}', style: context.titleMedium),
          subtitle: Text(item.status, style: context.bodySmall),
          trailing: StatusIcon(status: item.status),
        ),
      );
}
