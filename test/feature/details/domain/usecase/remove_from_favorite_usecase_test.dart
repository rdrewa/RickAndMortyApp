import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/remove_from_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final FavoriteRepository mockFavoriteRepository;
  late final RemoveFromFavoriteUsecase removeFromFavoriteUsecase;

  setUpAll(() {
    mockFavoriteRepository = MockFavoriteRepository();
    removeFromFavoriteUsecase =
        RemoveFromFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return void/null after removing item from favorite', () async {
    // arrange
    when(mockFavoriteRepository.removeItem(testCharacterInfo1))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await removeFromFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(null));
  });

  test('Should return failure after removing item from favorite', () async {
    // arrange
    const errorMessage = 'Database Failure';
    when(mockFavoriteRepository.removeItem(testCharacterInfo1))
        .thenAnswer((_) async => const Left(DatabaseFailure(errorMessage)));

    // act
    final result = await removeFromFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Left(DatabaseFailure(errorMessage)));
  });
}
