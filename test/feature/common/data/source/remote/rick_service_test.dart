import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';
import 'package:rick_morty_app/feature/common/data/source/remote/rick_service.dart';
import 'package:rick_morty_app/feature/details/data/model/character_details_data.dart';
import 'package:rick_morty_app/feature/home/data/model/character_info_data.dart';

import '../../../../../util/data.dart';
import '../../../../../util/fixture.dart';
import '../../../../../util/mocks.mocks.dart';

class MockedQueryOptions extends Mock implements QueryOptions {}

void main() {
  late MockGraphQLClient mockGraphQLClient;
  late MockedQueryOptions mockedQueryOptions;
  late RickService rickService;

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    mockedQueryOptions = MockedQueryOptions();
    rickService = RickGraphService(mockGraphQLClient);
  });

  group('Get CharacterInfo list', () {
    test('Should return CharacterInfo list when the response code is 200',
        () async {});
    test('', () async {
      // arrange
      when(mockGraphQLClient.query(mockedQueryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: mockedQueryOptions,
              source: QueryResultSource.optimisticResult,
              data: json.decode(fixture('test_character_list_1'))));

      // act
      final result = await rickService.getCharacterList(1);

      // assert
      expect(result, isA<CharacterInfoData>());
      expect(result?.characters, testCharacters1);
    });
  });

  group('Get CharacterDetails data', () {
    test('Should return CharacterDetails list when the response code is 200',
        () async {});
    test('', () async {
      // arrange
      when(mockGraphQLClient.query(mockedQueryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: mockedQueryOptions,
              source: QueryResultSource.optimisticResult,
              data: json.decode(fixture('test_character_details_1'))));

      // act
      final result = await rickService.getCharacterDetails(1);

      // assert
      expect(result, isA<CharacterDetailsData>());
      expect(result?.characterDetails, testCharacterDetails1);
    });
  });
}
