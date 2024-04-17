import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/details/domain/usecase/is_on_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final MockFavoriteRepository mockFavoriteRepository;
  late final IsOnFavoriteUsecase isOnFavoriteUsecase;

  setUpAll(() {
    mockFavoriteRepository = MockFavoriteRepository();
    isOnFavoriteUsecase = IsOnFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return true when character (info) is added', () async {
    // arrange
    when(mockFavoriteRepository.isAdded(any))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await isOnFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(true));
  });

  test('Should return false when character (info) is not added', () async {
    // arrange
    when(mockFavoriteRepository.isAdded(any))
        .thenAnswer((_) async => const Right(false));

    // act
    final result = await isOnFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(false));
  });
}
