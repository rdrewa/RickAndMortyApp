import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/domain/model/episode.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Episode from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('episode'));

    // act
    final result = Episode.fromJson(jsonMap);

    // assert
    expect(result, equals(testEpisode1));
  });

  test('Should return a valid model JSON map from object', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('episode'));

    // act
    final Map<String, dynamic> result = testEpisode1.toJson();

    // assert
    expect(result, equals(jsonMap));
  });
}
