import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_app/core/error/failure.dart';

import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/is_on_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final FavoriteRepository mockFavoriteRepository;
  late final IsOnFavoriteUsecase isOnFavoriteUsecase;

  setUpAll(() {
    mockFavoriteRepository = MockFavoriteRepository();
    isOnFavoriteUsecase = IsOnFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return true when character (info) is added', () async {
    // arrange
    when(mockFavoriteRepository.isAdded(1))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await isOnFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(true));
  });

  test('Should return false when character (info) is not added', () async {
    // arrange
    when(mockFavoriteRepository.isAdded(1))
        .thenAnswer((_) async => const Right(false));

    // act
    final result = await isOnFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(false));
  });

  test('Should return failure from repository', () async {
    // arrange
    const failureMessage = 'Database Failure';
    when(mockFavoriteRepository.isAdded(1))
        .thenAnswer((_) async => const Left(DatabaseFailure(failureMessage)));

    // act
    final result = await isOnFavoriteUsecase(testCharacterInfo1);

    // assert
    expect(result, const Left(DatabaseFailure(failureMessage)));
  });
}
