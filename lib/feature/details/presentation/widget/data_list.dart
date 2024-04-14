import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widget/status_icon.dart';
import '../../domain/model/character_details.dart';

class DataList extends StatelessWidget {
  final CharacterDetails details;

  const DataList({super.key, required this.details});

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        ListTile(
          title: Text('character.status'.tr()),
          subtitle: Text(details.status),
          trailing: StatusIcon(
            status: details.status,
          ),
        ),
        ListTile(
            title: Text('character.species'.tr()),
            subtitle: Text(details.species)),
        details.type.isNotEmpty
            ? ListTile(
                title: Text('character.type'.tr()),
                subtitle: Text(details.type))
            : const SizedBox.shrink(),
        ListTile(
            title: Text('character.gender'.tr()),
            subtitle: Text(details.speciesGender.tr())),
        ListTile(
            title: Text('character.origin'.tr()),
            subtitle: Text(details.origin.name)),
      ]));
}
