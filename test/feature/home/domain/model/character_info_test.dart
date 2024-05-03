import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model CharacterInfo from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('character_info'));

    // act
    final result = CharacterInfo.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacterInfo1));
  });

  test('Should return a valid model JSON map from object', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('character_info'));

    // act
    final Map<String, dynamic> result = testCharacterInfo1.toJson();

    // assert
    expect(result, equals(jsonMap));
  });
}
