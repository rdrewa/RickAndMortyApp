import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_app/core/error/failure.dart';

import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/favorite/domain/usecase/get_favorite_list_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final FavoriteRepository mockFavoriteRepository;
  late final GetFavoriteListUsecase getFavoriteListUsecase;

  setUpAll(() {
    mockFavoriteRepository = MockFavoriteRepository();
    getFavoriteListUsecase = GetFavoriteListUsecase(mockFavoriteRepository);
  });

  test('Should get Favorite list from repository', () async {
    // arrange
    when(mockFavoriteRepository.getList())
        .thenAnswer((_) async => Right(testCharacterInfoList1));

    // act
    final result = await getFavoriteListUsecase();

    // asseert
    expect(result, Right(testCharacterInfoList1));
  });

  test('Should return failure from repository', () async {
    // arrange
    const failureMessage = 'Database Failure';
    when(mockFavoriteRepository.getList())
        .thenAnswer((_) async => const Left(DatabaseFailure(failureMessage)));

    // act
    final result = await getFavoriteListUsecase();

    // assert
    expect(result, const Left(DatabaseFailure(failureMessage)));
  });
}
