import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/domain/repository/character_repository.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/get_character_details_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final CharacterRepository mockCharacterRepository;
  late final GetCharacterDetailsUsecase getCharacterDetailsUsecase;

  setUpAll(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterDetailsUsecase =
        GetCharacterDetailsUsecase(mockCharacterRepository);
  });

  test('Should get Character details from repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacterDetaisl(0))
        .thenAnswer((_) async => Right(testCharacterDetails1));

    // act
    final result = await getCharacterDetailsUsecase(1);

    // asseert
    expect(result, Right(testCharacterDetails1));
  });

  test('Should return failure when getting Character details', () async {
    // arrange
    const errorMessage = 'Server Failure';
    when(mockCharacterRepository.getCharacterDetaisl(0))
        .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

    // act
    final result = await getCharacterDetailsUsecase(0);

    // assert
    expect(result, const Left(ServerFailure(errorMessage)));
  });
}
