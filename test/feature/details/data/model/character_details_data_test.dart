import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/data/model/character_details_data.dart';
import 'package:rick_morty_app/feature/details/domain/model/character_details.dart';
import 'package:rick_morty_app/feature/details/domain/model/episode.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model CharacterDetailsData from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('character_details_data'));

    // act
    final result = CharacterDetailsData.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacterDetailsData1));
  });

  test('Should return a valid CharacterDetailsData JSON map from object ',
      () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('character_details_data'));

    // act
    final Map<String, dynamic> result = testCharacterDetailsData1.toJson();
    final CharacterDetails characterDetails =
        testCharacterDetailsData1.characterDetails;
    result['character'] = characterDetails.toJson();
    result['character']['origin'] = characterDetails.origin.toJson();
    result['character']['episode'] =
        characterDetails.episode.map((Episode e) => e.toJson()).toList();
    result['character']['location'] = characterDetails.location.toJson();

    // assert
    expect(result, equals(jsonMap));
  });
}
