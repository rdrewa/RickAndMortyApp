import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../home/domain/model/character_info.dart';
import '../../domain/repository/favorite_repository.dart';
import '../source/local/rick_database.dart';

part 'favorite_db_repository.g.dart';

@riverpod
FavoriteDbRepository favoriteDbRepository(FavoriteDbRepositoryRef ref) =>
    FavoriteDbRepository(ref.read(rickDatabaseProvider));

class FavoriteDbRepository implements FavoriteRepository {
  final RickDatabase _database;

  FavoriteDbRepository(this._database);

  @override
  Future<Either<Failure, void>> addItem(CharacterInfo item) async {
    try {
      await _database.insertFavorite(item.toFavorite());
      return const Right(null);
    } on SqliteException catch (s) {
      return Left(DatabaseFailure(s.message));
    }
  }

  @override
  Future<Either<Failure, List<CharacterInfo>>> getList() async {
    try {
      final result = await _database.getFavoriteList();
      final list = result
          .map((favorite) => CharacterInfo.fromFavorite(favorite))
          .toList();
      return Right(list);
    } on SqliteException catch (s) {
      return Left(DatabaseFailure(s.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isAdded(int id) async {
    try {
      final result = await _database.getFavorite(id);
      return Right(result != null);
    } on SqliteException catch (s) {
      return Left(DatabaseFailure(s.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeItem(CharacterInfo item) async {
    try {
      await _database.deleteFavorite(int.parse(item.id));
      return const Right(null);
    } on SqliteException catch (s) {
      return Left(DatabaseFailure(s.message));
    }
  }
}
