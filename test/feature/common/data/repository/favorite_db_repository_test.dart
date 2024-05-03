import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/core/error/failure.dart';
import 'package:rick_morty_app/feature/common/data/repository/favorite_db_repository.dart';
import 'package:rick_morty_app/feature/common/data/source/local/rick_database.dart';
import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

import '../../../../util/data.dart';

void main() {
  late RickDatabase rickDatabase;
  late FavoriteRepository favoriteRepository;

  setUp(() {
    rickDatabase = RickDatabase.forTesting(NativeDatabase.memory());
    favoriteRepository = FavoriteDbRepository(rickDatabase);
  });

  tearDown(() {
    rickDatabase.close();
  });

  group('Get Favorite list #1', () {
    test('Should create a Favorite item in database', () async {
      // arrange
      favoriteRepository.addItem(testCharacterInfo1);

      // act
      final Either<Failure, bool> result =
          await favoriteRepository.isAdded(int.parse(testCharacterInfo1.id));

      // assert
      result.fold(
          (left) => fail('test failed'), (right) => expect(right, true));
    });

    test(
        'Should return a database failure when trying to the same item two times',
        () async {
      // arrange
      favoriteRepository.addItem(testCharacterInfo1);

      // act
      Either<Failure, void> result =
          await favoriteRepository.addItem(testCharacterInfo1);

      // assert
      result.fold(
          (left) => expect(left, isA<DatabaseFailure>()), (right) => null);
    });

    test('Should remove a Favorite item from database', () async {
      // act / arrange
      favoriteRepository.addItem(testCharacterInfo1);

      // act
      favoriteRepository.removeItem(testCharacterInfo1);
      final Either<Failure, bool> result =
          await favoriteRepository.isAdded(int.parse(testCharacterInfo1.id));

      // assert
      result.fold(
          (left) => fail('test failed'), (right) => expect(right, false));
    });

    test('Should return Favorite list when call to database is successful',
        () async {
      for (var favorite in testCharacterInfoList1) {
        rickDatabase.insertFavorite(favorite.toFavoriteCompanion());
      }

      // act
      final Either<Failure, List<CharacterInfo>> result =
          await favoriteRepository.getList();

      // assert
      result.fold((left) => fail('test failed'),
          (right) => expect(right, testCharacterInfoList1));
    });
  });
}
