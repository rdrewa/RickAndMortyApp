import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/details/domain/usecase/get_character_details_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final MockCharacterRepository mockCharacterRepository;
  late final GetCharacterDetailsUsecase getCharacterDetailsUsecase;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterDetailsUsecase =
        GetCharacterDetailsUsecase(mockCharacterRepository);
  });

  test('Should get Character details from repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacterDetaisl(any))
        .thenAnswer((_) async => Right(testCharacterDetails1));

    // act
    final result = await getCharacterDetailsUsecase(1);

    // asseert
    expect(result, Right(testCharacterDetails1));
  });
}
