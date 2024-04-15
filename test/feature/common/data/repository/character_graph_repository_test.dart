import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/data/repository/character_graph_repository.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockRickGraphService mockRickGraphService;
  late CharacterGraphRepository characterGraphRepository;

  setUp(() {
    mockRickGraphService = MockRickGraphService();
    characterGraphRepository = CharacterGraphRepository(mockRickGraphService);
  });

  group('Get charater info list', () {
    test('Should return Characters object when a call to service is successful',
        () async {
      // arrange
      when(mockRickGraphService.getCharacterList(1))
          .thenAnswer((_) async => testCharacterInfoData1);

      // act
      final result = await characterGraphRepository.getCharacterList(1);

      // assert
      expect(result, equals(Right(testCharacters1)));
    });

    test('Should return server failure when a call to service is unsuccessful',
        () async {
      // arrange
      when(mockRickGraphService.getCharacterList(1))
          .thenThrow(OperationException());

      // act
      final result = await characterGraphRepository.getCharacterList(1);

      // assert
      expect(result, equals(const Left(ServerFailure('Operation Failure'))));
    });
  });

  group('Get charater details', () {
    test(
        'Should return CharacterDetails object when a call to service is successful',
        () async {
      // arrange
      when(mockRickGraphService.getCharacterDetails(1))
          .thenAnswer((_) async => testCharacterDetailsData1);

      // act
      final result = await characterGraphRepository.getCharacterDetaisl(1);

      // assert
      expect(result, equals(Right(testCharacterDetails1)));
    });

    test('Should return server failure when a call to service is unsuccessful',
        () async {
      // arrange
      when(mockRickGraphService.getCharacterDetails(1))
          .thenThrow(OperationException());

      // act
      final result = await characterGraphRepository.getCharacterDetaisl(1);

      // assert
      expect(result, equals(const Left(ServerFailure('Operation Failure'))));
    });
  });
}
