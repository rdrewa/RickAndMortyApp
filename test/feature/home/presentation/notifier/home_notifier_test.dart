import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/home/domain/usecase/get_character_list_usecase.dart';
import 'package:rick_morty_app/feature/home/presentation/notifier/home_notifier.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockGetCharacterListUsecase mockGetCharacterListUsecase;
  late HomeNotifier homeNotifier;
  late ProviderContainer providerContainer;
  late List<HomeState> states;

  setUp(() {
    mockGetCharacterListUsecase = MockGetCharacterListUsecase();
    providerContainer = ProviderContainer(overrides: [
      getCharacterListUsecaseProvider
          .overrideWith((ref) => mockGetCharacterListUsecase),
      homeNotifierProvider.overrideWith(() => HomeNotifier())
    ]);
  });

  test('Begin state should be Initial', () async {
    // arrange
    homeNotifier = providerContainer.read(homeNotifierProvider.notifier);

    // assert
    expect(homeNotifier.state, isA<HomeInitial>());
  });

  test('End state should be Loaded when data are available', () async {
    // arrange
    when(mockGetCharacterListUsecase(1))
        .thenAnswer((_) async => Right(testCharacters1));
    states = [];

    providerContainer.listen(homeNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    homeNotifier = providerContainer.read(homeNotifierProvider.notifier);

    // act
    await homeNotifier.getCharacterList();

    // assert
    expect(states, [
      HomeInitial(),
      HomeLoading(),
      HomeLoaded(testCharacterInfoList1, false, null)
    ]);
  });

  test('End state should be Failure when something is wrong', () async {
    const failureMessage = 'FAIL';
    // arrange
    when(mockGetCharacterListUsecase(1))
        .thenAnswer((_) async => const Left(ServerFailure(failureMessage)));
    states = [];

    providerContainer.listen(homeNotifierProvider, (previous, next) {
      states.add(next);
    }, fireImmediately: true);

    homeNotifier = providerContainer.read(homeNotifierProvider.notifier);

    // act
    await homeNotifier.getCharacterList();

    // assert
    expect(states, [HomeInitial(), HomeLoading(), HomeFailure(failureMessage)]);
  });
}
