import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/favorite_repository.dart';
import '../../../home/domain/model/character_info.dart';

part 'add_to_favorite_usecase.g.dart';

@riverpod
AddToFavoriteUsecase addToFavoriteUsecase(AddToFavoriteUsecaseRef ref) =>
    AddToFavoriteUsecase(ref.watch(favoriteRepositoryProvider));

class AddToFavoriteUsecase {
  final FavoriteRepository _repository;

  AddToFavoriteUsecase(this._repository);

  Future<Either<Failure, void>> call(CharacterInfo item) =>
      _repository.addItem(item);
}
