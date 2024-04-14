import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/presentation/widget/progress_wheel.dart';
import '../notifier/details_notifier.dart';
import '../widget/data_list.dart';
import '../widget/episode_list.dart';
import '../widget/pinned_header.dart';
import '../widget/top_info.dart';

@RoutePage()
class DetailsScreen extends HookConsumerWidget {
  final int id;

  const DetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() async =>
        ref.read(detailsNotifierProvider.notifier).getCharacterDetails(id));

    final state = ref.watch(detailsNotifierProvider);

    return Scaffold(
        body: switch (state) {
      DetailsInitial() => const SizedBox.shrink(),
      DetailsLoading() => const LargeProgressWheel(),
      DetailsLoaded() => CustomScrollView(
          slivers: [
            TopInfo(name: state.data.name, image: state.data.image),
            PinnedHeader(header: 'Data'.tr()),
            DataList(details: state.data),
            PinnedHeader(header: 'Episodes'.tr()),
            EpisodeList(list: state.data.episode),
          ],
        ),
      DetailsFailure() => Center(child: Text(state.message)),
    });
  }
}
