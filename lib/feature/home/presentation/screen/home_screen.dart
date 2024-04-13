import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/presentation/widget/app_drawer.dart';
import '../widget/character_item.dart';
import '../notifier/home_notifier.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController controller = useScrollController();
    useMemoized(() async {
      ref.read(homeNotifierProvider.notifier).getCharacterList();
      controller.addListener(() {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          ref.read(homeNotifierProvider.notifier).getCharacterList();
        }
      });
    });

    final state = ref.watch(homeNotifierProvider);

    return Scaffold(
        appBar: AppBar(title: Text('home.title'.tr())),
        drawer: const AppDrawer(),
        body: switch (state) {
          HomeInitial() => const SizedBox.shrink(),
          HomeLoading() => const CircularProgressIndicator(),
          HomeLoaded() => ListView.builder(
              controller: controller,
              itemCount: state.data.length + (state.canLoad ? 1 : 0),
              itemBuilder: (context, index) => index >= state.data.length
                  ? Center(
                      child: Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.all(40),
                          child: const CircularProgressIndicator()))
                  : CharacterItem(item: state.data[index])),
          HomeFailure() => Center(child: Text(state.message)),
        });
  }
}
