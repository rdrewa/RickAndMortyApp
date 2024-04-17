import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/favorite/domain/usecase/get_favorite_list_usecase.dart';
import 'package:rick_morty_app/feature/favorite/presentation/notifier/favorite_list_notifier.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockGetFavoriteListUsecase mockGetFavoriteListUsecase;
  late FavoriteListNotifier favoriteListNotifier;
  late ProviderContainer providerContainer;
  late List<FavoriteListState> states;
  const failureMessage = 'FAIL';

  setUp(() {
    mockGetFavoriteListUsecase = MockGetFavoriteListUsecase();
    providerContainer = ProviderContainer(overrides: [
      getFavoriteListUsecaseProvider
          .overrideWith((ref) => mockGetFavoriteListUsecase),
      favoriteListNotifierProvider.overrideWith(() => FavoriteListNotifier())
    ]);
  });

  test('Begin state should be Initial', () async {
    // arrange
    favoriteListNotifier =
        providerContainer.read(favoriteListNotifierProvider.notifier);

    // assert
    expect(favoriteListNotifier.state, isA<FavoriteListInitial>());
  });

  test('End state should be Loaded when data are available', () async {
    // arrange
    when(mockGetFavoriteListUsecase())
        .thenAnswer((_) async => Right(testCharacterInfoList1));
    states = [];

    providerContainer.listen(favoriteListNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    favoriteListNotifier =
        providerContainer.read(favoriteListNotifierProvider.notifier);

    // act
    await favoriteListNotifier.getFavoriteList();

    // assert
    expect(states, [
      FavoriteListInitial(),
      FavoriteListLoading(),
      FavoriteListLoaded(testCharacterInfoList1)
    ]);
  });

  test('End state should be Failure when something is wrong', () async {
    // arrange
    when(mockGetFavoriteListUsecase())
        .thenAnswer((_) async => const Left(DatabaseFailure(failureMessage)));
    states = [];

    providerContainer.listen(favoriteListNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    favoriteListNotifier =
        providerContainer.read(favoriteListNotifierProvider.notifier);

    // act
    await favoriteListNotifier.getFavoriteList();

    // assert
    expect(states, [
      FavoriteListInitial(),
      FavoriteListLoading(),
      FavoriteListFailure(failureMessage)
    ]);
  });
}
