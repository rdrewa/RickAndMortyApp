import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/favorite_repository.dart';
import '../../../home/domain/model/character_info.dart';

part 'remove_from_favorite_usecase.g.dart';

@riverpod
RemoveFromFavoriteUsecase removeFromFavoriteUsecase(
        RemoveFromFavoriteUsecaseRef ref) =>
    RemoveFromFavoriteUsecase(ref.watch(favoriteRepositoryProvider));

class RemoveFromFavoriteUsecase {
  final FavoriteRepository _repository;

  RemoveFromFavoriteUsecase(this._repository);

  Future<Either<Failure, void>> call(CharacterInfo item) =>
      _repository.removeItem(item);
}
