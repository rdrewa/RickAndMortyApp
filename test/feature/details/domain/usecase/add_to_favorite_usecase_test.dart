import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/add_to_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final FavoriteRepository mockFavoriteRepository;
  late final AddToFavoriteUsecase addToFavoriteUsecase;

  setUpAll(() {
    mockFavoriteRepository = MockFavoriteRepository();
    addToFavoriteUsecase = AddToFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return void/null after adding item to favorite', () async {
    // arrange
    when(mockFavoriteRepository.addItem(testCharacterInfo1))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await addToFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(null));
  });

  test('Should return failure after adding item to favorite', () async {
    // arrange
    const errorMessage = 'Database Failure';
    when(mockFavoriteRepository.addItem(testCharacterInfo1))
        .thenAnswer((_) async => const Left(DatabaseFailure(errorMessage)));

    // act
    final result = await addToFavoriteUsecase(testCharacterInfo1);

    // assert
    expect(result, const Left(DatabaseFailure(errorMessage)));
  });
}
