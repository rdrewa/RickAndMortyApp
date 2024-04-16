import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/favorite_repository.dart';
import '../../../home/domain/model/character_info.dart';

part 'is_on_favorite_usecase.g.dart';

@riverpod
IsOnFavoriteUsecase isOnFavoriteUsecase(IsOnFavoriteUsecaseRef ref) =>
    IsOnFavoriteUsecase(ref.watch(favoriteRepositoryProvider));

class IsOnFavoriteUsecase {
  final FavoriteRepository _repository;

  IsOnFavoriteUsecase(this._repository);

  Future<Either<Failure, bool>> call(CharacterInfo item) =>
      _repository.isAdded(int.parse(item.id));
}
