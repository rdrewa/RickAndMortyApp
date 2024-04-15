import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/favorite_repository.dart';
import '../../../home/domain/model/character_info.dart';

class GetFavoriteListUsecase {
  final FavoriteRepository _repository;

  GetFavoriteListUsecase(this._repository);

  Future<Either<Failure, List<CharacterInfo>>> call() async =>
      _repository.getList();
}
