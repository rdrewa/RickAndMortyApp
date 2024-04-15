import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/domain/model/character_details.dart';

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
}
