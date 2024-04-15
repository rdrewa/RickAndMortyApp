import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/home/data/model/characters.dart';

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
}
