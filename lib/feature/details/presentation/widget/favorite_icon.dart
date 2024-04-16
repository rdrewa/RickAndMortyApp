import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/extension/build_context_theme_extension.dart';
import '../../../home/domain/model/character_info.dart';
import '../notifier/favorite_operation_notifier.dart';

class FavoriteIcon extends HookConsumerWidget {
  final CharacterInfo item;

  const FavoriteIcon({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color color = context.colorScheme.onBackground;
    useMemoized(() {
      ref.read(favoriteOperationNotifierProvider.notifier).isOnList(item);
    });

    final state = ref.watch(favoriteOperationNotifierProvider);

    return state.isAdded
        ? IconButton(
            onPressed: () => ref
                .read(favoriteOperationNotifierProvider.notifier)
                .removeFromList(item),
            icon: Icon(Icons.star, color: color))
        : IconButton(
            onPressed: () => ref
                .read(favoriteOperationNotifierProvider.notifier)
                .addToList(item),
            icon: Icon(Icons.star_border, color: color));
  }
}
