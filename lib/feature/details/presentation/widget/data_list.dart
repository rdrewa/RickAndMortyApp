import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widget/status_icon.dart';
import '../../domain/model/character_details.dart';
import 'data_card.dart';

class DataList extends StatelessWidget {
  final CharacterDetails details;

  const DataList({super.key, required this.details});

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        DataCard(
            label: 'character.status'.tr(),
            text: details.status,
            icon: StatusIcon(
              status: details.status,
            )),
        DataCard(label: 'character.species'.tr(), text: details.species),
        DataCard(label: 'character.type'.tr(), text: details.type),
        DataCard(
            label: 'character.gender'.tr(), text: details.speciesGender.tr()),
        DataCard(label: 'character.origin'.tr(), text: details.origin.name),
        DataCard(label: 'character.location'.tr(), text: details.location.name),
      ]));
}
