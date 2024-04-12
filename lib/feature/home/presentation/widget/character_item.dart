import 'package:flutter/material.dart';
import 'status_icon.dart';

import '../../domain/model/character_info.dart';

class CharacterItem extends StatelessWidget {
  final CharacterInfo item;

  const CharacterItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image(image: NetworkImage(item.image)),
        title: Text(item.name),
        subtitle: Text(item.status),
        trailing: StatusIcon(status: item.status),
      );
}
