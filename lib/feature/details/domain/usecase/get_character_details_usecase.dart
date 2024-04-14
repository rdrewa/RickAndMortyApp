import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../common/domain/repository/character_repository.dart';
import '../model/character_details.dart';

part 'get_character_details_usecase.g.dart';

@riverpod
GetCharacterDetailsUsecase getCharacterDetailsUsecase(
        GetCharacterDetailsUsecaseRef ref) =>
    GetCharacterDetailsUsecase(ref.watch(characterRepositoryProvider));

class GetCharacterDetailsUsecase {
  final CharacterRepository _repository;

  GetCharacterDetailsUsecase(this._repository);

  Future<Either<Failure, CharacterDetails>> call(int id) async =>
      _repository.getCharacterDetaisl(id);
}
