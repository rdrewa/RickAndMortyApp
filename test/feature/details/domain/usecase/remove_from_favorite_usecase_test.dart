import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/details/domain/usecase/remove_from_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final MockFavoriteRepository mockFavoriteRepository;
  late final RemoveFromFavoriteUsecase removeFromFavoriteUsecase;

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    removeFromFavoriteUsecase =
        RemoveFromFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return void/null after removing item from favorite', () async {
    // arrange
    when(mockFavoriteRepository.removeItem(any))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await removeFromFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(null));
  });
}
