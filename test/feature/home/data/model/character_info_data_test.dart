import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/home/data/model/character_info_data.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model CharacterInfoData from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('character_info_data'));

    // act
    final result = CharacterInfoData.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacterInfoData1));
  });
}
