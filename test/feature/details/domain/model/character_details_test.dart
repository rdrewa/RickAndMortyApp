import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/domain/model/character_details.dart';
import 'package:rick_morty_app/feature/details/domain/model/episode.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model CharacterDetails from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('character_details'));

    // act
    final result = CharacterDetails.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacterDetails1));
  });

  test('Should return a valid JSON map from object ', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('character_details'));

    // act
    final Map<String, dynamic> result = testCharacterDetails1.toJson();
    result['origin'] = testCharacterDetails1.origin.toJson();
    result['episode'] =
        testCharacterDetails1.episode.map((Episode e) => e.toJson()).toList();
    result['location'] = testCharacterDetails1.location.toJson();

    // assert
    expect(result, equals(jsonMap));
  });
}
