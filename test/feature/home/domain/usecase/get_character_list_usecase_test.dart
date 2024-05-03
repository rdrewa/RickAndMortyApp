import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/feature/common/domain/repository/character_repository.dart';
import 'package:rick_morty_app/feature/home/domain/usecase/get_character_list_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late final CharacterRepository mockCharacterRepository;
  late final GetCharacterListUsecase getCharacterListUsecase;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterListUsecase = GetCharacterListUsecase(mockCharacterRepository);
  });

  test('Should get Characters envelope from repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacterList(1))
        .thenAnswer((_) async => Right(testCharacters1));

    // act
    final result = await getCharacterListUsecase(1);

    // asseert
    expect(result, Right(testCharacters1));
  });
}
