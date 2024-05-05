import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/home/data/model/characters.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Characters from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('characters'));

    // act
    final result = Characters.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacters1));
  });

  test('Should return a valid model JSON map from object', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('characters'));

    // act
    final Map<String, dynamic> result = testCharacters1.toJson();
    result['info'] = testCharacters1.info.toJson();
    result['results'] =
        testCharacters1.results.map((CharacterInfo e) => e.toJson()).toList();

    // assert
    expect(result, equals(jsonMap));
  });
}
