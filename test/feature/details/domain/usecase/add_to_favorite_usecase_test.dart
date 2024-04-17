import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/details/domain/usecase/add_to_favorite_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final MockFavoriteRepository mockFavoriteRepository;
  late final AddToFavoriteUsecase addToFavoriteUsecase;

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    addToFavoriteUsecase = AddToFavoriteUsecase(mockFavoriteRepository);
  });

  test('Should return void/null after adding item to favorite', () async {
    // arrange
    when(mockFavoriteRepository.addItem(any))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await addToFavoriteUsecase(testCharacterInfo1);

    // asseert
    expect(result, const Right(null));
  });
}
