import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/character_repository.dart';
import '../model/character_details.dart';

class GetCharacterDetailsUsecase {
  final CharacterRepository _repository;

  GetCharacterDetailsUsecase(this._repository);

  Future<Either<Failure, CharacterDetails>> call(int id) async =>
      _repository.getCharacterDetaisl(id);
}
