import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty_app/feature/home/data/model/info.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Info from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('info'));

    // act
    final result = Info.fromJson(jsonMap);

    // assert
    expect(result, equals(testInfo1));
  });
}
