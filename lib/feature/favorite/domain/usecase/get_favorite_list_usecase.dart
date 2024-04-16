import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/favorite_repository.dart';
import '../../../home/domain/model/character_info.dart';

part 'get_favorite_list_usecase.g.dart';

@riverpod
GetFavoriteListUsecase getFavoriteListUsecase(GetFavoriteListUsecaseRef ref) =>
    GetFavoriteListUsecase(ref.watch(favoriteRepositoryProvider));

class GetFavoriteListUsecase {
  final FavoriteRepository _repository;

  GetFavoriteListUsecase(this._repository);

  Future<Either<Failure, List<CharacterInfo>>> call() async =>
      _repository.getList();
}
