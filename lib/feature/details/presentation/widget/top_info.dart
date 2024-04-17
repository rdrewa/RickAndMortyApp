import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'favorite_icon.dart';

import '../../../home/domain/model/character_info.dart';
import '../../domain/model/character_details.dart';

class TopInfo extends StatelessWidget {
  final CharacterDetails details;

  const TopInfo({super.key, required this.details});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 240,
        floating: true,
        pinned: true,
        actions: [FavoriteIcon(item: CharacterInfo.fromDetails(details))],
        flexibleSpace: FlexibleSpaceBar(
          title: Text(details.name),
          collapseMode: CollapseMode.pin,
          background: Image(
            image: CachedNetworkImageProvider(details.image),
            fit: BoxFit.cover,
          ),
        ),
      );
}
