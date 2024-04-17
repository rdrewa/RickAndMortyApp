import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/add_to_favorite_usecase.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/is_on_favorite_usecase.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/remove_from_favorite_usecase.dart';
import 'package:rick_morty_app/feature/details/presentation/notifier/favorite_operation_notifier.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockIsOnFavoriteUsecase mockIsOnFavoriteUsecase;
  late MockAddToFavoriteUsecase mockAddToFavoriteUsecase;
  late MockRemoveFromFavoriteUsecase mockRemoveFromFavoriteUsecase;
  late FavoriteOperationNotifier favoriteOperationNotifier;
  late ProviderContainer providerContainer;
  late List<FavoriteOperationState> states;
  const failureMessage = 'FAIL';

  setUp(() {
    mockIsOnFavoriteUsecase = MockIsOnFavoriteUsecase();
    mockAddToFavoriteUsecase = MockAddToFavoriteUsecase();
    mockRemoveFromFavoriteUsecase = MockRemoveFromFavoriteUsecase();
    providerContainer = ProviderContainer(overrides: [
      isOnFavoriteUsecaseProvider
          .overrideWith((ref) => mockIsOnFavoriteUsecase),
      addToFavoriteUsecaseProvider
          .overrideWith((ref) => mockAddToFavoriteUsecase),
      removeFromFavoriteUsecaseProvider
          .overrideWith((ref) => mockRemoveFromFavoriteUsecase),
      favoriteOperationNotifierProvider
          .overrideWith(() => FavoriteOperationNotifier())
    ]);
  });

  test('Begin state should be always [FavoriteOperationState(FALSE)] ',
      () async {
    // arrange
    favoriteOperationNotifier =
        providerContainer.read(favoriteOperationNotifierProvider.notifier);

    // assert
    expect(favoriteOperationNotifier.state, isA<FavoriteOperationState>());
    expect(favoriteOperationNotifier.state,
        const FavoriteOperationState(isAdded: false));
  });

  group('Is on favorite', () {
    test(
        'Should emit [FavoriteOperationState(TRUE)] when checking is Character on Favorite list is successful',
        () async {
      // arrange
      when(mockIsOnFavoriteUsecase(any))
          .thenAnswer((_) async => const Right(true));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.isOnList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
        const FavoriteOperationState(isAdded: true)
      ]);
    });

    test(
        'Should emit [FavoriteOperationState(FALSE)] when checking is Character on Favorite list is successful',
        () async {
      // arrange
      when(mockIsOnFavoriteUsecase(any))
          .thenAnswer((_) async => const Right(false));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.isOnList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
        const FavoriteOperationState(isAdded: false)
      ]);
    });
  });

  group('Add to favorite', () {
    test('Should emit [FavoriteOperationState(TRUE)] when added successfully',
        () async {
      // arrange
      when(mockAddToFavoriteUsecase(any))
          .thenAnswer((_) async => const Right(null));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.addToList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
        const FavoriteOperationState(isAdded: true)
      ]);
    });

    test('Should not emit a new state when added unsuccessfully', () async {
      // arrange
      when(mockAddToFavoriteUsecase(any))
          .thenAnswer((_) async => const Left(DatabaseFailure(failureMessage)));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.addToList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
      ]);
    });
  });

  group('Remove from favorite', () {
    test(
        'Should emit [FavoriteOperationState(FALSE)] when removed successfully',
        () async {
      // arrange
      when(mockRemoveFromFavoriteUsecase(any))
          .thenAnswer((_) async => const Right(null));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.removeFromList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
        const FavoriteOperationState(isAdded: false)
      ]);
    });

    test('Should not emit a new state when added unsuccessfully', () async {
      // arrange
      when(mockRemoveFromFavoriteUsecase(any))
          .thenAnswer((_) async => const Left(DatabaseFailure(failureMessage)));
      states = [];

      providerContainer.listen(favoriteOperationNotifierProvider,
          (previous, next) {
        states.add(next);
      }, fireImmediately: true);

      favoriteOperationNotifier =
          providerContainer.read(favoriteOperationNotifierProvider.notifier);

      // act
      await favoriteOperationNotifier.removeFromList(testCharacterInfo1);

      // assert
      expect(states, [
        const FavoriteOperationState(isAdded: false),
      ]);
    });
  });
}
