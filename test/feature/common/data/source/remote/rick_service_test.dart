import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'package:rick_morty_app/feature/common/data/source/remote/queries.dart';
import 'package:rick_morty_app/feature/common/data/source/remote/rick_service.dart';
import 'package:rick_morty_app/feature/details/data/model/character_details_data.dart';
import 'package:rick_morty_app/feature/home/data/model/character_info_data.dart';

import '../../../../../util/data.dart';
import '../../../../../util/fixture.dart';
import '../../../../../util/mocks.mocks.dart';

void main() {
  late GraphQLClient mockGraphQLClient;
  late RickService rickService;

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    rickService = RickGraphService(mockGraphQLClient);
  });

  group('Get CharacterInfo list', () {
    test('Should return CharacterInfo list when the response code is 200',
        () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterList), variables: const {'page': 1});

      when(mockGraphQLClient.query(queryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: queryOptions,
              source: QueryResultSource.network,
              data: json.decode(fixture('character_info_data'))));

      // act
      final result = await rickService.getCharacterList(1);

      // assert
      expect(result, isA<CharacterInfoData>());
      expect(result?.characters, testCharacters1);
    });

    test('Should return Exception when QueryResult has an Exception', () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterList), variables: const {'page': 1});

      when(mockGraphQLClient.query(queryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: queryOptions,
              source: QueryResultSource.network,
              exception: OperationException()));

      // act / assert
      expect(() => rickService.getCharacterList(1), throwsA(isA<Exception>()));
    });

    test('Should return Exception when client rethrown an Exception', () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterList), variables: const {'page': 1});

      when(mockGraphQLClient.query(queryOptions)).thenThrow(Exception());

      // act / assert
      expect(() => rickService.getCharacterList(1), throwsA(isA<Exception>()));
    });
  });

  group('Get CharacterDetails data', () {
    test('Should return CharacterDetails list when the response code is 200',
        () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterDetails), variables: const {'id': 1});
      when(mockGraphQLClient.query(queryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: queryOptions,
              source: QueryResultSource.optimisticResult,
              data: json.decode(fixture('character_details_data'))));

      // act
      final result = await rickService.getCharacterDetails(1);

      // assert
      expect(result, isA<CharacterDetailsData>());
      expect(result?.characterDetails, testCharacterDetails1);
    });

    test('Should return Exception when QueryResult has an Exception', () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterDetails), variables: const {'id': 1});
      when(mockGraphQLClient.query(queryOptions)).thenAnswer((_) async =>
          QueryResult(
              options: queryOptions,
              source: QueryResultSource.network,
              exception: OperationException()));

      // act / assert
      expect(
          () => rickService.getCharacterDetails(1), throwsA(isA<Exception>()));
    });

    test('Should return Exception when client rethrown an Exception', () async {
      // arrange
      final queryOptions = QueryOptions(
          document: gql(Queries.characterDetails), variables: const {'id': 1});

      when(mockGraphQLClient.query(queryOptions)).thenThrow(Exception());

      // act / assert
      expect(
          () => rickService.getCharacterDetails(1), throwsA(isA<Exception>()));
    });
  });
}
