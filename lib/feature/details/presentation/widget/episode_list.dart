import 'package:flutter/material.dart';

import '../../domain/model/episode.dart';
import 'episode_card.dart';

class EpisodeList extends StatelessWidget {
  final List<Episode> list;
  const EpisodeList({super.key, required this.list});

  @override
  Widget build(BuildContext context) => SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) =>
              EpisodeCard(title: list[index].title, number: list[index].number),
          childCount: list.length));
}
