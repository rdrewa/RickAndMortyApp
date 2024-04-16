import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/app/app_router.dart';
import '/core/extension/build_context_theme_extension.dart';
import 'status_icon.dart';
import '../../../home/domain/model/character_info.dart';

class CharacterItem extends StatelessWidget {
  final CharacterInfo item;
  final Color? color;

  const CharacterItem({super.key, required this.item, this.color});

  @override
  Widget build(BuildContext context) => Card(
        color: color,
        child: ListTile(
          leading: Image(image: NetworkImage(item.image)),
          title: Text(item.name, style: context.titleMedium),
          subtitle: Text(item.species, style: context.bodySmall),
          trailing: StatusIcon(status: item.status),
          onTap: () => context.navigateTo(DetailsRoute(id: int.parse(item.id))),
        ),
      );
}
