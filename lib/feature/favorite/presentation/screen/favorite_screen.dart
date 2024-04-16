import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/extension/build_context_theme_extension.dart';
import '../../../common/presentation/widget/error_box.dart';
import '../../../common/presentation/widget/empty_box.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../common/presentation/widget/app_drawer.dart';
import '../../../common/presentation/widget/character_item.dart';
import '../notifier/favorite_list_notifier.dart';

@RoutePage()
class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() async {
      ref.read(favoriteListNotifierProvider.notifier).getFavoriteList();
    });

    final state = ref.watch(favoriteListNotifierProvider);

    return Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
        body: switch (state) {
          FavoriteListInitial() => const SizedBox.shrink(),
          FavoriteListEmpty() => EmptyBox(
              message: 'favorite.empty'.tr(),
            ),
          FavoriteListLoading() => const LargeProgressWheel(),
          FavoriteListLoaded() => ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.data.length,
              itemBuilder: (context, index) => CharacterItem(
                    item: state.data[index],
                    color: context.colorScheme.tertiary,
                  )),
          FavoriteListFailure() => ErrorBox(message: state.message),
        });
  }
}
