import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/details/domain/model/origin.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Origin from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('origin'));

    // act
    final result = Origin.fromJson(jsonMap);

    // assert
    expect(result, equals(testOrigin1));
  });
}
