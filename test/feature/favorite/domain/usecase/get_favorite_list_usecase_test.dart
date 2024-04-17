import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/favorite/domain/usecase/get_favorite_list_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final MockFavoriteRepository mockFavoriteRepository;
  late final GetFavoriteListUsecase getFavoriteListUsecase;

  setUp(() {
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
}
