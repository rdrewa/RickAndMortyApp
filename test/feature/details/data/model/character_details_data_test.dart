import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/data/model/character_details_data.dart';

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
}
