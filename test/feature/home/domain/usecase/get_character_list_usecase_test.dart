import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_app/core/error/failure.dart';

import 'package:rick_morty_app/feature/common/domain/repository/character_repository.dart';
import 'package:rick_morty_app/feature/home/data/model/characters.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';
import 'package:rick_morty_app/feature/home/domain/usecase/get_character_list_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final CharacterRepository mockCharacterRepository;
  late final GetCharacterListUsecase getCharacterListUsecase;

  setUpAll(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterListUsecase = GetCharacterListUsecase(mockCharacterRepository);
  });

  test('Should get Characters envelope filled from repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacterList(1))
        .thenAnswer((_) async => Right(testCharacters1));

    // act
    final result = await getCharacterListUsecase(1);

    // assert
    expect(result, Right(testCharacters1));
  });

  test('Should get Characters envelope empty from repository', () async {
    // arrange
    const empty = Characters(info: testInfo1, results: <CharacterInfo>[]);
    when(mockCharacterRepository.getCharacterList(1))
        .thenAnswer((_) async => const Right(empty));

    // act
    final result = await getCharacterListUsecase(1);

    // assert
    expect(result, const Right(empty));
  });

  test('Should return failure from repository', () async {
    // arrange
    const failureMassage = 'Server Failure';
    when(mockCharacterRepository.getCharacterList(1))
        .thenAnswer((_) async => const Left(ServerFailure(failureMassage)));

    // act
    final result = await getCharacterListUsecase(1);

    // assert
    expect(result, const Left(ServerFailure(failureMassage)));
  });
}
