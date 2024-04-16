import 'package:dartz/dartz.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../home/domain/model/character_info.dart';
import '../../data/repository/favorite_db_repository.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    ref.watch(favoriteDbRepositoryProvider);

abstract class FavoriteRepository {
  Future<Either<Failure, List<CharacterInfo>>> getList();
  Future<Either<Failure, void>> addItem(CharacterInfo item);
  Future<Either<Failure, void>> removeItem(CharacterInfo item);
  Future<Either<Failure, bool>> isAdded(int id);
}
