import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/domain/model/location.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Location from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('location'));

    // act
    final result = Location.fromJson(jsonMap);

    // assert
    expect(result, equals(testLocation1));
  });
}
