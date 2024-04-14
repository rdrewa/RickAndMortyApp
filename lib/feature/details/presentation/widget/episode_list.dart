import 'package:flutter/material.dart';

import '../../domain/model/episode.dart';

class EpisodeList extends StatelessWidget {
  final List<Episode> list;
  const EpisodeList({super.key, required this.list});

  @override
  Widget build(BuildContext context) => SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => ListTile(
                title: Text(
                    '${list[index].id}: "${list[index].title} [${list[index].number}]"'),
              ),
          childCount: list.length));
}
