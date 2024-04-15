import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/get_character_details_usecase.dart';
import 'package:rick_morty_app/feature/details/presentation/notifier/details_notifier.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockGetCharacterDetailsUsecase mockGetCharacterDetailsUsecase;
  late DetailsNotifier detailsNotifier;
  late ProviderContainer providerContainer;
  late List<DetailsState> states;

  setUp(() {
    mockGetCharacterDetailsUsecase = MockGetCharacterDetailsUsecase();
    providerContainer = ProviderContainer(overrides: [
      getCharacterDetailsUsecaseProvider
          .overrideWith((ref) => mockGetCharacterDetailsUsecase),
      detailsNotifierProvider.overrideWith(() => DetailsNotifier())
    ]);
  });

  test('Begin state should be Initial', () async {
    // arrange
    detailsNotifier = providerContainer.read(detailsNotifierProvider.notifier);

    // assert
    expect(detailsNotifier.state, isA<DetailsInitial>());
  });

  test('End state should be Loaded when data are available', () async {
    // arrange
    when(mockGetCharacterDetailsUsecase(1))
        .thenAnswer((_) async => Right(testCharacterDetails1));
    states = [];

    providerContainer.listen(detailsNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    detailsNotifier = providerContainer.read(detailsNotifierProvider.notifier);

    // act
    await detailsNotifier.getCharacterDetails(1);

    // assert
    expect(states, [
      DetailsInitial(),
      DetailsLoading(),
      DetailsLoaded(testCharacterDetails1)
    ]);
  });

  test('End state should be Failure when something is wrong', () async {
    const failureMessage = 'FAIL';
    // arrange
    when(mockGetCharacterDetailsUsecase(1))
        .thenAnswer((_) async => const Left(ServerFailure(failureMessage)));
    states = [];

    providerContainer.listen(detailsNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    detailsNotifier = providerContainer.read(detailsNotifierProvider.notifier);

    // act
    await detailsNotifier.getCharacterDetails(1);

    // assert
    expect(states,
        [DetailsInitial(), DetailsLoading(), DetailsFailure(failureMessage)]);
  });
}
