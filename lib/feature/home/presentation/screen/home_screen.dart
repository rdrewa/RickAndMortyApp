import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/character_item.dart';
import '../notifier/home_notifier.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() async {
      ref.read(homeNotifierProvider.notifier).getCharacterList();
    });
    final state = ref.watch(homeNotifierProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        body: switch (state) {
          HomeInitial() => const SizedBox.shrink(),
          HomeLoading() => const CircularProgressIndicator(),
          HomeLoaded() => ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  CharacterItem(item: state.data[index])),
          HomeFailure() => Center(child: Text(state.message)),
        });
  }
}


/*
Center(
        child: Text('Hello, Rick X.Y-World!'),
      )
*/