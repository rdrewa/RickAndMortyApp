import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/data/repository/favorite_db_repository.dart';
import 'package:rick_morty_app/feature/common/data/source/local/rick_database.dart';
import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.mocks.dart';

void main() {
  late MockRickDatabase mockRickDatabase;
  late FavoriteRepository favoriteRepository;

  final List<FavoriteData> favoriteDataList = testCharacterInfoList1
      .map((character) => character.toFavoriteData())
      .toList();

  setUp(() {
    mockRickDatabase = MockRickDatabase();
    favoriteRepository = FavoriteDbRepository(mockRickDatabase);
  });

  group('Get Favorite list', () {
    const errorMessage = 'Database Error';
    test('Should return Favorite list when call to database is successful',
        () async {
      // arrange

      when(mockRickDatabase.getFavoriteList())
          .thenAnswer((_) async => favoriteDataList);

      // act
      final Either<Failure, List<CharacterInfo>> result =
          await favoriteRepository.getList();

      // assert
      result.fold((left) => fail('test failed'),
          (right) => expect(right, testCharacterInfoList1));
    });

    test('Should return failure when call to database is unsuccessful',
        () async {
      // arrange
      when(mockRickDatabase.getFavoriteList())
          .thenThrow(SqliteException(404, errorMessage));

      // act
      final Either<Failure, List<CharacterInfo>> result =
          await favoriteRepository.getList();

      // assert
      expect(result, equals(const Left(DatabaseFailure(errorMessage))));
    });
  });
}

/*
Expected: Right<dynamic, List<CharacterInfo>>:<Right([CharacterInfo(Rick Sanchez, 1, Alive, https://rickandmortyapi.com/api/character/avatar/1.jpeg, Human), CharacterInfo(Morty Smith, 2, Alive, https://rickandmortyapi.com/api/character/avatar/2.jpeg, Human), CharacterInfo(Summer Smith, 3, Alive, https://rickandmortyapi.com/api/character/avatar/3.jpeg, Human)])>
  Actual: Right<Failure, List<CharacterInfo>>:<Right([CharacterInfo(Rick Sanchez, 1, Alive, https://rickandmortyapi.com/api/character/avatar/1.jpeg, Human), CharacterInfo(Morty Smith, 2, Alive, https://rickandmortyapi.com/api/character/avatar/2.jpeg, Human), CharacterInfo(Summer Smith, 3, Alive, https://rickandmortyapi.com/api/character/avatar/3.jpeg, Human)])>

*/